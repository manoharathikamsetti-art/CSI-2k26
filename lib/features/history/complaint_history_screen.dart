import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../models/complaint.dart';
import '../../services/mock_data_service.dart';

class ComplaintHistoryScreen extends StatefulWidget {
  const ComplaintHistoryScreen({super.key});

  @override
  State<ComplaintHistoryScreen> createState() => _ComplaintHistoryScreenState();
}

class _ComplaintHistoryScreenState extends State<ComplaintHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  late final List<Complaint> _complaints = MockDataService.complaints();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final complaints = _complaints.where((item) {
      final haystack = [item.category, item.department, item.status, item.tokenNumber, item.summary].join(' ').toLowerCase();
      return haystack.contains(_query.toLowerCase());
    }).toList();

    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Complaint History',
        subtitle: 'Search and revisit grievance submissions.',
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.citizenHome);
          } else if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.profile);
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.history_outlined), selectedIcon: Icon(Icons.history_rounded), label: 'History'),
          NavigationDestination(icon: Icon(Icons.person_outline_rounded), selectedIcon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AppSearchBar(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: MetricCard(
                  title: 'Open',
                  value: '1',
                  icon: Icons.pending_actions_rounded,
                  color: AppColors.warning,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(
                  title: 'Resolved',
                  value: '1',
                  icon: Icons.check_circle_rounded,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (complaints.isEmpty)
            const EmptyState(
              title: 'No complaints found',
              subtitle: 'Try a different keyword or open a new grievance.',
            )
          else
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
