import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../services/n8n_voice_complaint_service.dart';

class VoiceRecordingScreen extends StatefulWidget {
  const VoiceRecordingScreen({super.key});

  @override
  State<VoiceRecordingScreen> createState() => _VoiceRecordingScreenState();
}

class _VoiceRecordingScreenState extends State<VoiceRecordingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();
  final N8nVoiceComplaintService _submissionService = const N8nVoiceComplaintService();

  StreamSubscription<PlayerState>? _playerStateSubscription;
  String? _recordingPath;
  bool _isRecording = false;
  bool _isPlaying = false;
  bool _isSubmitting = false;

  bool get _hasRecording => _recordingPath != null && File(_recordingPath!).existsSync();

  @override
  void initState() {
    super.initState();
    _playerStateSubscription = _player.playerStateStream.listen((state) {
      if (!mounted) {
        return;
      }

      final playing = state.playing && state.processingState != ProcessingState.completed;
      if (state.processingState == ProcessingState.completed) {
        unawaited(_player.seek(Duration.zero));
      }

      setState(() {
        _isPlaying = playing;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    unawaited(_playerStateSubscription?.cancel());
    unawaited(_recorder.dispose());
    unawaited(_player.dispose());
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (_isSubmitting || _isRecording) {
      return;
    }

    final l10n = context.l10n;
    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      _showSnackBar(l10n.microphonePermissionRequired);
      return;
    }

    await _player.stop();
    await _deleteRecordingFile();

    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}${Platform.pathSeparator}voice_complaint_${DateTime.now().millisecondsSinceEpoch}.m4a';

    try {
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          sampleRate: 16000,
          numChannels: 1,
        ),
        path: filePath,
      );
      if (!mounted) {
        return;
      }

      setState(() {
        _recordingPath = filePath;
        _isRecording = true;
        _isPlaying = false;
      });
    } catch (_) {
      _showSnackBar(l10n.recordingFailedSnackbar);
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) {
      return;
    }

    try {
      final path = await _recorder.stop();
      if (!mounted) {
        return;
      }

      setState(() {
        _recordingPath = path ?? _recordingPath;
        _isRecording = false;
        _isPlaying = false;
      });
    } catch (_) {
      _showSnackBar(context.l10n.uploadFailedSnackbar);
    }
  }

  Future<void> _playRecording() async {
    if (!_hasRecording || _isRecording || _isSubmitting) {
      return;
    }

    try {
      await _player.setFilePath(_recordingPath!);
      await _player.play();
    } catch (_) {
      _showSnackBar(context.l10n.uploadFailedSnackbar);
    }
  }

  Future<void> _pausePlayback() async {
    if (_isSubmitting) {
      return;
    }

    await _player.pause();
  }

  Future<void> _deleteRecording() async {
    if (_isRecording) {
      await _stopRecording();
    }

    await _player.stop();
    await _deleteRecordingFile();

    if (!mounted) {
      return;
    }

    setState(() {
      _recordingPath = null;
      _isPlaying = false;
      _isRecording = false;
    });
  }

  Future<void> _generateLetter() async {
    final l10n = context.l10n;
    final citizenName = _nameController.text.trim();

    if (citizenName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationCitizenNameRequired)));
      return;
    }

    if (!_hasRecording) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationRecordingRequired)));
      return;
    }

    if (_isRecording) {
      await _stopRecording();
    }

    final recordingPath = _recordingPath;
    if (recordingPath == null || !File(recordingPath).existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationRecordingRequired)));
      return;
    }

    if (_isSubmitting) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final navigator = Navigator.of(context, rootNavigator: true);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const LoadingIndicator(),
    );

    try {
      final generatedLetter = await _submissionService.submitComplaint(
        citizenName: citizenName,
        audioFilePath: recordingPath,
        l10n: l10n,
      );

      if (navigator.canPop()) {
        navigator.pop();
      }

      await _deleteRecording();

      if (!mounted) {
        return;
      }

      Navigator.pushNamed(context, AppRoutes.generatedLetter, arguments: generatedLetter);
    } on StateError catch (error) {
      if (navigator.canPop()) {
        navigator.pop();
      }
      if (mounted) {
        _showSnackBar(
          error.message.contains('configured')
              ? l10n.webhookNotConfiguredSnackbar
              : l10n.uploadFailedSnackbar,
        );
      }
    } catch (_) {
      if (navigator.canPop()) {
        navigator.pop();
      }
      if (mounted) {
        _showSnackBar(l10n.uploadFailedSnackbar);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _deleteRecordingFile() async {
    final recordingPath = _recordingPath;
    if (recordingPath == null) {
      return;
    }

    final file = File(recordingPath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  void _showSnackBar(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: l10n.voiceComplaintTitle,
        subtitle: l10n.voiceComplaintSubtitle,
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: l10n.citizenNameLabel, style: Theme.of(context).textTheme.titleMedium),
                        TextSpan(text: ' *', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.error)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    controller: _nameController,
                    label: l10n.citizenNameLabel,
                    hintText: l10n.citizenNameHint,
                    prefixIcon: Icons.person_rounded,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryActionButton(
                          label: l10n.recordButton,
                          icon: Icons.mic_rounded,
                          onPressed: _isRecording || _isSubmitting ? () {} : _startRecording,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SecondaryActionButton(
                          label: l10n.stopButton,
                          icon: Icons.stop_rounded,
                          onPressed: _isRecording ? _stopRecording : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SectionHeader(
                    title: l10n.recordedAudioLabel,
                    subtitle: _isRecording
                        ? l10n.recordingInProgressLabel
                        : _hasRecording
                            ? l10n.audioReadyLabel
                            : l10n.noRecordingYetLabel,
                  ),
                  const SizedBox(height: 12),
                  StatusBadge(
                    label: _isRecording
                        ? l10n.recordingInProgressLabel
                        : _hasRecording
                            ? l10n.audioReadyLabel
                            : l10n.noRecordingYetLabel,
                    color: _isRecording ? AppColors.warning : AppColors.success,
                  ),
                  const SizedBox(height: 14),
                  if (_hasRecording) ...[
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryActionButton(
                            label: _isPlaying ? l10n.pauseButton : l10n.playButton,
                            icon: _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                            onPressed: _isPlaying ? _pausePlayback : _playRecording,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SecondaryActionButton(
                            label: l10n.deleteRecordingButton,
                            icon: Icons.delete_rounded,
                            onPressed: _deleteRecording,
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    Text(
                      l10n.noRecordingYetLabel,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  const SizedBox(height: 20),
                  PrimaryActionButton(
                    label: l10n.generateLetterButton,
                    icon: Icons.auto_awesome_rounded,
                    onPressed: _isSubmitting ? () {} : _generateLetter,
                  ),
                ],
              ),
            ),
          ).animate().fadeIn().slideY(begin: 0.08, end: 0),
        ],
      ),
    );
  }
}
