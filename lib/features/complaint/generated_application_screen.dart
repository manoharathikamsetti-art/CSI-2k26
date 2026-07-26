import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class GeneratedApplicationScreen extends StatelessWidget {
  const GeneratedApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Generated Letter',
        subtitle: 'AI drafted application ready for review.',
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
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.description_rounded, color: AppColors.accent),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('District Collectorate Application', style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 4),
                            Text('Prepared automatically from the grievance transcript.', style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'To,\nThe District Collector,\nCollectorate Office,\n\nSubject: Request for urgent road repair at Ward 8\n\nRespected Sir/Madam,\n\nI request immediate attention to the damaged road near Ward 8. The situation is affecting school transport and emergency access. Kindly arrange a field inspection and initiate corrective action at the earliest.\n\nThank you.',
                    style: TextStyle(height: 1.55),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: MetricCard(
                  title: 'Entities detected',
                  value: '4',
                  icon: Icons.smart_toy_rounded,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(
                  title: 'Tone',
                  value: 'Formal',
                  icon: Icons.verified_rounded,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryActionButton(
            label: 'Review Summary',
            icon: Icons.fact_check_rounded,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.complaintSummary),
          ),
          const SizedBox(height: 12),
          SecondaryActionButton(
            label: 'Regenerate',
            icon: Icons.refresh_rounded,
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.aiProcessing),
          ),
        ],
      ),
    );
  }
}
