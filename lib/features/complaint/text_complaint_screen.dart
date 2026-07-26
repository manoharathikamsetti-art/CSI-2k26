import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';
import '../../providers/app_state_scope.dart';

class TextComplaintScreen extends StatefulWidget {
  const TextComplaintScreen({super.key});

  @override
  State<TextComplaintScreen> createState() => _TextComplaintScreenState();
}

class _TextComplaintScreenState extends State<TextComplaintScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'Ananya Rao');
  final TextEditingController _locationController = TextEditingController(text: 'Ward 8, Collectorate Road');
  final TextEditingController _detailsController = TextEditingController(
    text: 'The road surface is broken and causes delays for school vehicles and ambulances.',
  );

  String _selectedCategory = 'Road Repair';
  String _selectedPriority = 'High';

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final complaintType = AppStateScope.of(context).selectedComplaintType;

    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Text Complaint',
        subtitle: 'Compose a structured grievance in a guided form.',
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
                  Text('Draft template', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    'Current selected type: $complaintType',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: _nameController,
                    label: 'Citizen name',
                    prefixIcon: Icons.person_rounded,
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    controller: _locationController,
                    label: 'Location',
                    prefixIcon: Icons.location_on_rounded,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedCategory,
                    decoration: const InputDecoration(labelText: 'Category'),
                    items: const [
                      'Road Repair',
                      'Water Leakage',
                      'Streetlight',
                      'Sanitation',
                      'Pension',
                    ]
                        .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedCategory = value ?? _selectedCategory),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedPriority,
                    decoration: const InputDecoration(labelText: 'Priority'),
                    items: const ['Low', 'Medium', 'High']
                        .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedPriority = value ?? _selectedPriority),
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    controller: _detailsController,
                    label: 'Complaint details',
                    prefixIcon: Icons.description_rounded,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16),
                  PrimaryActionButton(
                    label: 'Submit to AI Processing',
                    icon: Icons.auto_awesome_rounded,
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.aiProcessing),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              Expanded(
                child: MetricCard(
                  title: 'Fields completed',
                  value: '5/5',
                  icon: Icons.fact_check_rounded,
                  color: AppColors.success,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(
                  title: 'AI confidence',
                  value: '96%',
                  icon: Icons.psychology_rounded,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
