import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class ComplaintSummaryScreen extends StatelessWidget {
  const ComplaintSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Complaint Summary',
        subtitle: 'Review the auto-extracted grievance details.',
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
                  _SummaryRow(label: 'Citizen', value: 'Ananya Rao'),
                  _SummaryRow(label: 'Department', value: 'Public Works'),
                  _SummaryRow(label: 'Category', value: 'Road Repair'),
                  _SummaryRow(label: 'Priority', value: 'High'),
                  _SummaryRow(label: 'Location', value: 'Ward 8, Collectorate Road'),
                  const SizedBox(height: 12),
                  const Text(
                    'Summary: The damaged road is causing transport delays and safety concerns, requiring rapid field inspection and maintenance.',
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
                  title: 'AI accuracy',
                  value: '97%',
                  icon: Icons.bolt_rounded,
                  color: AppColors.accent,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(
                  title: 'Assigned queue',
                  value: 'PW-02',
                  icon: Icons.queue_rounded,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryActionButton(
            label: 'Generate Token',
            icon: Icons.confirmation_number_rounded,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.token),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
