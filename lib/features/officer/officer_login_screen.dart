import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class OfficerLoginScreen extends StatelessWidget {
  const OfficerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Officer Login',
        subtitle: 'Secure entry point for district officers and reviewers.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const Icon(Icons.verified_user_rounded, size: 56, color: Colors.blue),
                  const SizedBox(height: 12),
                  Text('Collectorate officer workspace', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 18),
                  const AppTextField(label: 'Employee ID', prefixIcon: Icons.badge_rounded),
                  const SizedBox(height: 12),
                  const AppTextField(label: 'Password', prefixIcon: Icons.lock_rounded),
                  const SizedBox(height: 12),
                  PrimaryActionButton(
                    label: 'Login to Dashboard',
                    icon: Icons.login_rounded,
                    onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.officerDashboard),
                  ),
                  const SizedBox(height: 10),
                  SecondaryActionButton(
                    label: 'Citizen Portal',
                    icon: Icons.home_rounded,
                    onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.citizenHome),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const _SecurityNote(),
        ],
      ),
    );
  }
}

class _SecurityNote extends StatelessWidget {
  const _SecurityNote();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Role-based access', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            SizedBox(height: 8),
            Text('The frontend demonstrates a secure portal entry experience with separate citizen and officer journeys.'),
          ],
        ),
      ),
    );
  }
}
