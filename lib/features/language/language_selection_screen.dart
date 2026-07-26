import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../models/language_option.dart';
import '../../providers/app_state_scope.dart';
import '../../services/mock_data_service.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = MockDataService.languages();

    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Choose Language',
        subtitle: 'Select the language that feels most comfortable.',
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.officerLogin),
            icon: const Icon(Icons.admin_panel_settings_rounded),
          ),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _HeroPanel(),
          const SizedBox(height: 18),
          SectionHeader(
            title: 'Language options',
            subtitle: 'AI assisted translation is available in the frontend demo.',
          ),
          const SizedBox(height: 12),
          ...languages.map(
            (language) => _LanguageTile(
              language: language,
              selected: AppStateScope.of(context).languageCode == language.code,
              onTap: () {
                AppStateScope.of(context).updateLanguage(language.code);
                Navigator.pushReplacementNamed(context, AppRoutes.citizenHome);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(Icons.translate_rounded, size: 30, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inclusive citizen access',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Multilingual experience for citizens, officers and field staff.',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.language,
    required this.selected,
    required this.onTap,
  });

  final LanguageOption language;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: selected ? AppColors.primary : AppColors.background,
            foregroundColor: selected ? Colors.white : AppColors.primary,
            child: Text(language.icon),
          ),
          title: Text(language.label),
          subtitle: Text(language.nativeLabel),
          trailing: selected
              ? const Icon(Icons.check_circle_rounded, color: AppColors.success)
              : const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ),
      ),
    );
  }
}
