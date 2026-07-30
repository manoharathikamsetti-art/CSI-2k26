import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../services/grievance_letter_service.dart';

class TextComplaintScreen extends StatefulWidget {
  const TextComplaintScreen({super.key});

  @override
  State<TextComplaintScreen> createState() => _TextComplaintScreenState();
}

class _TextComplaintScreenState extends State<TextComplaintScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _generateLetter() {
    final l10n = context.l10n;
    final citizenName = _nameController.text.trim();
    final complaint = _complaintController.text.trim();

    if (citizenName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationCitizenNameRequired)));
      return;
    }
    if (complaint.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.validationComplaintRequired)));
      return;
    }

    final generatedLetter = GrievanceLetterService.generateLetter(
      citizenName: citizenName,
      complaintText: complaint,
      l10n: l10n,
    );

    Navigator.pushNamed(context, AppRoutes.generatedLetter, arguments: generatedLetter);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: l10n.textComplaintTitle,
        subtitle: l10n.textComplaintSubtitle,
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
                  Text(l10n.citizenNameLabel, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: _nameController,
                    label: l10n.citizenNameLabel,
                    hintText: l10n.citizenNameHint,
                    prefixIcon: Icons.person_rounded,
                  ),
                  const SizedBox(height: 18),
                  Text(l10n.complaintLabel, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 10),
                  AppTextField(
                    controller: _complaintController,
                    label: l10n.complaintLabel,
                    hintText: l10n.complaintHint,
                    prefixIcon: Icons.description_rounded,
                    maxLines: 8,
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
