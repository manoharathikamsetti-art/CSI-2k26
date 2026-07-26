import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Citizen Dashboard',
        subtitle: 'A clean snapshot of grievance operations and service coverage.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: const [
              Expanded(
                child: MetricCard(title: 'Active grievances', value: '18', icon: Icons.campaign_rounded, color: AppColors.primary),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(title: 'Avg. closure', value: '4.2d', icon: Icons.timelapse_rounded, color: AppColors.accent),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: MetricCard(title: 'Service reach', value: '92%', icon: Icons.hub_rounded, color: AppColors.success),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(title: 'Reopened', value: '03', icon: Icons.restart_alt_rounded, color: AppColors.warning),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('District focus', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  const _DistrictBar(label: 'Roads', value: 0.86),
                  const _DistrictBar(label: 'Water', value: 0.68),
                  const _DistrictBar(label: 'Electricity', value: 0.74),
                  const _DistrictBar(label: 'Sanitation', value: 0.81),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryActionButton(
            label: 'Open Officer Analytics',
            icon: Icons.analytics_rounded,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.analytics),
          ),
        ],
      ),
    );
  }
}

class _DistrictBar extends StatelessWidget {
  const _DistrictBar({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text('${(value * 100).round()}%'),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: value),
        ],
      ),
    );
  }
}
