import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../services/grievance_letter_service.dart';

class VoiceRecordingScreen extends StatefulWidget {
  const VoiceRecordingScreen({super.key});

  @override
  State<VoiceRecordingScreen> createState() => _VoiceRecordingScreenState();
}

class _VoiceRecordingScreenState extends State<VoiceRecordingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _recordedTextController = TextEditingController();
  bool _recording = false;

  @override
  void dispose() {
    _nameController.dispose();
    _recordedTextController.dispose();
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      _recording = !_recording;
      if (_recording) {
        _recordedTextController.text = context.l10n.recordingPlaceholder;
      }
    });
  }

  void _generateLetter() {
    final l10n = context.l10n;
    final citizenName = _nameController.text.trim();
    final transcript = _recordedTextController.text.trim();

    if (citizenName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationCitizenNameRequired)));
      return;
    }
    if (transcript.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationRecordedTextRequired)));
      return;
    }

    final generatedLetter = GrievanceLetterService.generateLetter(
      citizenName: citizenName,
      complaintText: transcript,
      l10n: l10n,
    );

    Navigator.pushNamed(context, AppRoutes.generatedLetter, arguments: generatedLetter);
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
                          onPressed: _toggleRecording,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SecondaryActionButton(
                          label: l10n.stopButton,
                          icon: Icons.stop_rounded,
                          onPressed: _recording ? _toggleRecording : () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    l10n.recordedTextPreviewLabel,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(
                      _recordedTextController.text.isEmpty ? l10n.recordedTextHint : _recordedTextController.text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryActionButton(
                    label: l10n.generateLetterButton,
                    icon: Icons.auto_awesome_rounded,
                    onPressed: _generateLetter,
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
