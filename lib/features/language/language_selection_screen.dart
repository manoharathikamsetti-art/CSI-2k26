import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../providers/app_state_scope.dart';
import '../../l10n/app_localizations.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: l10n.languageTitle,
        subtitle: l10n.languageSubtitle,
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _HeroPanel(),
          const SizedBox(height: 18),
          SectionHeader(title: l10n.languageTitle, subtitle: l10n.languageSubtitle),
          const SizedBox(height: 12),
          _LanguageCard(
            title: l10n.englishLanguage,
            subtitle: l10n.languageCardHint,
            selected: AppStateScope.of(context).languageCode == 'en',
            onTap: () => _selectLanguage(context, 'en'),
          ),
          _LanguageCard(
            title: l10n.teluguLanguage,
            subtitle: l10n.languageCardHint,
            selected: AppStateScope.of(context).languageCode == 'te',
            onTap: () => _selectLanguage(context, 'te'),
          ),
          _LanguageCard(
            title: l10n.hindiLanguage,
            subtitle: l10n.languageCardHint,
            selected: AppStateScope.of(context).languageCode == 'hi',
            onTap: () => _selectLanguage(context, 'hi'),
          ),
        ],
      ),
    );
  }

  void _selectLanguage(BuildContext context, String code) {
    AppStateScope.of(context).updateLanguage(code);
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }
}

class _HeroPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.languageTitle, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(height: 6),
                  Text(l10n.languageSubtitle, style: TextStyle(color: AppColors.textSecondary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.translate_rounded, color: selected ? Colors.white : AppColors.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                Icon(selected ? Icons.check_circle_rounded : Icons.arrow_forward_ios_rounded, color: selected ? AppColors.success : AppColors.textSecondary, size: 18),
              ],
            ),
          ),
        ).animate().fadeIn().scale(begin: const Offset(0.98, 0.98)),
      ),
    );
  }
}
