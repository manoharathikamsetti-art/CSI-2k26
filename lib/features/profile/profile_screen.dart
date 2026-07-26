import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        subtitle: 'Citizen identity and usage overview.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                    ),
                    child: const Icon(Icons.person_rounded, color: Colors.white, size: 34),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ananya Rao', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        const Text('Citizen ID: C-20491'),
                        const SizedBox(height: 8),
                        const StatusBadge(label: 'Verified Citizen', color: AppColors.success),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: MetricCard(title: 'Complaints', value: '08', icon: Icons.note_alt_rounded, color: AppColors.primary)),
              SizedBox(width: 12),
              Expanded(child: MetricCard(title: 'Resolved', value: '05', icon: Icons.check_circle_rounded, color: AppColors.success)),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.history_rounded, color: AppColors.primary),
                  title: const Text('Complaint History'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.complaintHistory),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.settings_rounded, color: AppColors.primary),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.logout_rounded, color: AppColors.error),
                  title: const Text('Officer Login'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.officerLogin),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
