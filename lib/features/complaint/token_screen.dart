import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class TokenScreen extends StatelessWidget {
  const TokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Token Generated',
        subtitle: 'Track your grievance with the assigned token.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                    ),
                    child: const Icon(Icons.confirmation_number_rounded, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 16),
                  Text('TK-2451', style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(height: 8),
                  Text('Your complaint has been registered successfully.', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  const StatusBadge(label: 'In Progress', color: AppColors.primary),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: const [
                  _TrackStep(active: true, title: 'Submitted', subtitle: '22 Jul 2026, 09:30 AM'),
                  _TrackStep(active: true, title: 'AI processed', subtitle: '22 Jul 2026, 09:33 AM'),
                  _TrackStep(active: false, title: 'Officer assigned', subtitle: 'Awaiting assignment'),
                  _TrackStep(active: false, title: 'Resolution completed', subtitle: 'Pending'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryActionButton(
            label: 'View Complaint History',
            icon: Icons.history_rounded,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.complaintHistory),
          ),
          const SizedBox(height: 12),
          SecondaryActionButton(
            label: 'Go to Home',
            icon: Icons.home_rounded,
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.citizenHome, (route) => false),
          ),
        ],
      ),
    );
  }
}

class _TrackStep extends StatelessWidget {
  const _TrackStep({required this.active, required this.title, required this.subtitle});

  final bool active;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.success : AppColors.textSecondary;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(active ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color)),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
