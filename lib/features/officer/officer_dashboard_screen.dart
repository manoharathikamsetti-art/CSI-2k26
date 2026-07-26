import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../services/mock_data_service.dart';

class OfficerDashboardScreen extends StatelessWidget {
  const OfficerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final complaints = MockDataService.complaints();

    return GovernmentScaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar(
        title: 'Officer Dashboard',
        subtitle: 'Monitor case load, priority queues and field actions.',
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.analytics),
            icon: const Icon(Icons.analytics_rounded),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.analytics);
          } else if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.complaintHistory);
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.analytics_outlined), selectedIcon: Icon(Icons.analytics_rounded), label: 'Analytics'),
          NavigationDestination(icon: Icon(Icons.list_alt_outlined), selectedIcon: Icon(Icons.list_alt_rounded), label: 'Cases'),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: const [
              Expanded(child: MetricCard(title: 'Assigned', value: '42', icon: Icons.assignment_rounded, color: AppColors.primary)),
              SizedBox(width: 12),
              Expanded(child: MetricCard(title: 'Escalated', value: '07', icon: Icons.priority_high_rounded, color: AppColors.warning)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(child: MetricCard(title: 'Resolved', value: '128', icon: Icons.check_circle_rounded, color: AppColors.success)),
              SizedBox(width: 12),
              Expanded(child: MetricCard(title: 'SLA compliance', value: '94%', icon: Icons.verified_rounded, color: AppColors.accent)),
            ],
          ),
          const SizedBox(height: 16),
          SectionHeader(
            title: 'Priority queue',
            subtitle: 'Open complaints ready for review and assignment.',
            actionLabel: 'Analytics',
            onActionTap: () => Navigator.pushNamed(context, AppRoutes.analytics),
          ),
          const SizedBox(height: 12),
          ...complaints.map(
            (complaint) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ComplaintCard(
                complaint: complaint,
                onTap: () => Navigator.pushNamed(context, AppRoutes.complaintDetails),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
