import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_widgets.dart';

class ComplaintDetailsScreen extends StatelessWidget {
  const ComplaintDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Complaint Details',
        subtitle: 'Officer review and action workflow.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('TK-2451', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                            SizedBox(height: 4),
                            Text('Road Repair • Public Works'),
                          ],
                        ),
                      ),
                      StatusBadge(label: 'In Progress', color: AppColors.primary),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'A damaged road near Ward 8 is affecting school transport and emergency access. Field inspection is recommended immediately.',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Activity timeline', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  SizedBox(height: 14),
                  _TimelineItem(title: 'Registered', subtitle: 'Citizen submitted the grievance'),
                  _TimelineItem(title: 'AI processed', subtitle: 'Summary, category and priority created'),
                  _TimelineItem(title: 'Assigned', subtitle: 'Pending officer assignment'),
                  _TimelineItem(title: 'Resolution', subtitle: 'Awaiting completion'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: MetricCard(title: 'Priority', value: 'High', icon: Icons.flag_rounded, color: AppColors.warning),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(title: 'SLA clock', value: '02:14', icon: Icons.timer_rounded, color: AppColors.accent),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryActionButton(
            label: 'Assign Field Team',
            icon: Icons.assignment_ind_rounded,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          SecondaryActionButton(
            label: 'Escalate Case',
            icon: Icons.trending_up_rounded,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
