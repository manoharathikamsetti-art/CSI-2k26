import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../l10n/app_localizations.dart';

class CitizenHomeScreen extends StatelessWidget {
  const CitizenHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isWide = MediaQuery.of(context).size.width >= 720;

    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: l10n.homeTitle,
        subtitle: l10n.homeSubtitle,
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(
                width: isWide ? (MediaQuery.of(context).size.width - 52) / 2 : double.infinity,
                child: _ActionCard(
                  icon: Icons.mic_rounded,
                  title: l10n.voiceComplaintTitle,
                  subtitle: l10n.voiceComplaintSubtitle,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.voiceComplaint),
                ),
              ),
              SizedBox(
                width: isWide ? (MediaQuery.of(context).size.width - 52) / 2 : double.infinity,
                child: _ActionCard(
                  icon: Icons.edit_note_rounded,
                  title: l10n.textComplaintTitle,
                  subtitle: l10n.textComplaintSubtitle,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.textComplaint),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.09),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: AppColors.primary, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 6),
                    Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
