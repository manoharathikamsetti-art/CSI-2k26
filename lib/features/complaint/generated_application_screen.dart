import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/app_state_scope.dart';
import '../../models/generated_letter.dart';

class GeneratedApplicationScreen extends StatefulWidget {
  const GeneratedApplicationScreen({super.key, this.draft});

  final GeneratedLetter? draft;

  @override
  State<GeneratedApplicationScreen> createState() => _GeneratedApplicationScreenState();
}

enum _ExitChoice { cancel, discard, save }

class _GeneratedApplicationScreenState extends State<GeneratedApplicationScreen> {
  final TextEditingController _letterController = TextEditingController();
  final FocusNode _letterFocusNode = FocusNode();
  bool _initialized = false;
  bool _isEditing = false;
  String _savedLetterText = '';

  @override
  void dispose() {
    _letterController.dispose();
    _letterFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) {
      return;
    }

    final appState = AppStateScope.of(context);
    final draft = widget.draft ?? appState.generatedLetter;
    if (draft != null) {
      appState.setGeneratedLetter(draft);
      final storedText = appState.generatedLetterText.isNotEmpty ? appState.generatedLetterText : draft.fullLetter;
      _letterController.text = storedText;
      _savedLetterText = storedText;
    } else {
      _letterController.text = appState.generatedLetterText;
      _savedLetterText = appState.savedGeneratedLetterText;
    }
    _initialized = true;
  }

  GeneratedLetter _generatedLetter(AppLocalizations l10n) {
    final appState = AppStateScope.of(context);
    return widget.draft ?? appState.generatedLetter ?? GeneratedLetter(
      citizenName: '',
      recommendedDepartment: l10n.departmentRevenue,
      departmentIcon: Icons.account_balance_rounded,
      complaintCategory: l10n.categoryRevenue,
      subject: l10n.subjectLabel,
      body: '',
      fullLetter: '',
    );
  }

  bool get _hasUnsavedChanges => _letterController.text != _savedLetterText;

  Future<void> _startEditing() async {
    if (_isEditing) {
      return;
    }

    setState(() => _isEditing = true);
    AppStateScope.of(context).setGeneratedLetterEditing(true);
    await Future<void>.delayed(Duration.zero);
    if (mounted) {
      _letterFocusNode.requestFocus();
      _letterController.selection = TextSelection.fromPosition(TextPosition(offset: _letterController.text.length));
    }
  }

  Future<void> _saveChanges({bool showConfirmation = true}) async {
    final text = _letterController.text;
    _savedLetterText = text;
    AppStateScope.of(context).saveGeneratedLetterText(text);
    if (mounted) {
      setState(() => _isEditing = false);
      if (showConfirmation) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.letterUpdatedSnackbar)));
      }
    }
  }

  Future<void> _copyLetter() async {
    final text = _letterController.text;
    final l10n = context.l10n;
    if (text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.snackNothingToCopy)));
      return;
    }
    await Clipboard.setData(ClipboardData(text: text));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.snackLetterCopied)));
    }
  }

  Future<void> _printLetter() async {
    final text = _letterController.text;
    await Printing.layoutPdf(
      onLayout: (format) async {
        final document = pw.Document();
        document.addPage(
          pw.Page(
            build: (pageContext) => pw.Padding(
              padding: const pw.EdgeInsets.all(24),
              child: pw.Text(text, style: const pw.TextStyle(fontSize: 12, lineSpacing: 6)),
            ),
          ),
        );
        return document.save();
      },
    );
  }

  Future<bool> _handleExitRequest() async {
    if (!_isEditing || !_hasUnsavedChanges) {
      return true;
    }

    final choice = await showDialog<_ExitChoice>(
      context: context,
      builder: (dialogContext) {
        final l10n = context.l10n;
        return AlertDialog(
          title: Text(l10n.unsavedChangesTitle),
          content: Text(l10n.unsavedChangesMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, _ExitChoice.cancel),
              child: Text(l10n.cancelButton),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, _ExitChoice.discard),
              child: Text(l10n.discardButton),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, _ExitChoice.save),
              child: Text(l10n.saveButton),
            ),
          ],
        );
      },
    );

    switch (choice) {
      case _ExitChoice.save:
        await _saveChanges(showConfirmation: false);
        if (mounted) {
          Navigator.of(context).pop();
        }
        return false;
      case _ExitChoice.discard:
        return true;
      case _ExitChoice.cancel:
      case null:
        return false;
    }
  }

  Future<void> _generateAnotherLetter() async {
    final canLeave = await _handleExitRequest();
    if (canLeave && mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final generated = _generatedLetter(l10n);

    return PopScope(
      canPop: !_isEditing || !_hasUnsavedChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final canLeave = await _handleExitRequest();
        if (canLeave && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: GovernmentScaffold(
        appBar: CustomAppBar(
          title: l10n.generatedLetterTitle,
          subtitle: l10n.appTagline,
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
                    _InfoRow(label: l10n.citizenNameHeading, value: generated.citizenName),
                    const SizedBox(height: 14),
                    _InfoRow(label: l10n.transcribedComplaintHeading, value: generated.transcribedText),
                    const SizedBox(height: 14),
                    _DepartmentCard(label: l10n.recommendedDepartmentHeading, department: generated.recommendedDepartment, icon: generated.departmentIcon),
                    const SizedBox(height: 14),
                    _InfoRow(label: l10n.complaintCategoryHeading, value: generated.complaintCategory),
                  ],
                ),
              ),
            ).animate().fadeIn().slideY(begin: 0.08, end: 0),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(l10n.generatedLetterHeading, style: Theme.of(context).textTheme.titleLarge),
                        ),
                        StatusBadge(
                          label: _isEditing ? l10n.editingModeBadge : l10n.latestVersionBadge,
                          color: _isEditing ? AppColors.warning : AppColors.success,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      constraints: const BoxConstraints(minHeight: 350),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: TextField(
                        controller: _letterController,
                        focusNode: _letterFocusNode,
                        readOnly: !_isEditing,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: null,
                        minLines: 16,
                        scrollPhysics: const BouncingScrollPhysics(),
                        style: const TextStyle(height: 1.6),
                        onChanged: (_) {
                          if (_savedLetterText.isEmpty) {
                            _savedLetterText = generated.fullLetter;
                          }
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          filled: false,
                          contentPadding: EdgeInsets.all(18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(delay: 120.ms).slideY(begin: 0.08, end: 0),
            const SizedBox(height: 16),
            PrimaryActionButton(
              label: l10n.editLetterButton,
              icon: Icons.edit_rounded,
              onPressed: _startEditing,
            ),
            const SizedBox(height: 12),
            SecondaryActionButton(
              label: l10n.saveChangesButton,
              icon: Icons.save_rounded,
              onPressed: _isEditing ? () async => _saveChanges(showConfirmation: true) : null,
            ),
            const SizedBox(height: 12),
            SecondaryActionButton(
              label: l10n.copyLetterButton,
              icon: Icons.copy_rounded,
              onPressed: _copyLetter,
            ),
            const SizedBox(height: 12),
            SecondaryActionButton(
              label: l10n.printLetterButton,
              icon: Icons.print_rounded,
              onPressed: _printLetter,
            ),
            const SizedBox(height: 12),
            SecondaryActionButton(
              label: l10n.generateAnotherLetterButton,
              icon: Icons.refresh_rounded,
              onPressed: _generateAnotherLetter,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value.isEmpty ? '-' : value,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}

class _DepartmentCard extends StatelessWidget {
  const _DepartmentCard({required this.label, required this.department, required this.icon});

  final String label;
  final String department;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text(department, style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
