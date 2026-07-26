import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_widgets.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  const AnalyticsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Analytics Dashboard',
        subtitle: 'High-level operational trends for the district.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: const [
              Expanded(child: MetricCard(title: 'Volume trend', value: '+18%', icon: Icons.trending_up_rounded, color: AppColors.primary)),
              SizedBox(width: 12),
              Expanded(child: MetricCard(title: 'Citizen satisfaction', value: '4.8/5', icon: Icons.sentiment_satisfied_alt_rounded, color: AppColors.success)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(child: MetricCard(title: 'Escalations', value: '12', icon: Icons.report_rounded, color: AppColors.warning)),
              SizedBox(width: 12),
              Expanded(child: MetricCard(title: 'Closed on time', value: '91%', icon: Icons.schedule_rounded, color: AppColors.accent)),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Complaint composition', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 18),
                  const _ChartRow(label: 'Roads', value: 0.88, color: AppColors.primary),
                  const _ChartRow(label: 'Water', value: 0.73, color: AppColors.secondary),
                  const _ChartRow(label: 'Power', value: 0.61, color: AppColors.accent),
                  const _ChartRow(label: 'Sanitation', value: 0.54, color: AppColors.warning),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const _InsightsGrid(),
        ],
      ),
    );
  }
}

class _ChartRow extends StatelessWidget {
  const _ChartRow({required this.label, required this.value, required this.color});

  final String label;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(label), Text('${(value * 100).round()}%')],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(value: value, minHeight: 10, backgroundColor: AppColors.border, color: color),
          ),
        ],
      ),
    );
  }
}

class _InsightsGrid extends StatelessWidget {
  const _InsightsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 700 ? 2 : 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: const [
        MetricCard(title: 'Peak issue hour', value: '10 AM', icon: Icons.schedule_rounded, color: AppColors.primary),
        MetricCard(title: 'AI triage speed', value: '12 sec', icon: Icons.flash_on_rounded, color: AppColors.accent),
      ],
    );
  }
}
