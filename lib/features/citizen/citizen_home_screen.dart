import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class CitizenHomeScreen extends StatelessWidget {
  const CitizenHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      drawer: const AppDrawer(),
      appBar: CustomAppBar(
        title: AppStrings.citizenPortal,
        subtitle: 'Welcome back, citizen. Raise and track grievances easily.',
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.complaintHistory),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            icon: const Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.complaintHistory);
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
          _HeroCard(),
          const SizedBox(height: 18),
          SectionHeader(
            title: 'Quick actions',
            subtitle: 'Start a grievance in under a minute.',
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 700 ? 3 : 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _ActionCard(
                icon: Icons.mic_rounded,
                title: 'Voice Complaint',
                subtitle: 'Speak naturally and let AI prepare the draft.',
                onTap: () => Navigator.pushNamed(context, AppRoutes.voiceComplaint),
              ),
              _ActionCard(
                icon: Icons.edit_note_rounded,
                title: 'Text Complaint',
                subtitle: 'Type the issue with category and location.',
                onTap: () => Navigator.pushNamed(context, AppRoutes.textComplaint),
              ),
              _ActionCard(
                icon: Icons.verified_rounded,
                title: 'Track Token',
                subtitle: 'View the latest token and grievance status.',
                onTap: () => Navigator.pushNamed(context, AppRoutes.token),
              ),
              _ActionCard(
                icon: Icons.history_rounded,
                title: 'Complaint History',
                subtitle: 'Review previous applications and outcomes.',
                onTap: () => Navigator.pushNamed(context, AppRoutes.complaintHistory),
              ),
              _ActionCard(
                icon: Icons.analytics_rounded,
                title: 'District Dashboard',
                subtitle: 'See service trends and response metrics.',
                onTap: () => Navigator.pushNamed(context, AppRoutes.analytics),
              ),
              _ActionCard(
                icon: Icons.admin_panel_settings_rounded,
                title: 'Officer Login',
                subtitle: 'Enter the officer workspace.',
                onTap: () => Navigator.pushNamed(context, AppRoutes.officerLogin),
              ),
            ],
          ),
          const SizedBox(height: 22),
          SectionHeader(
            title: 'Featured insights',
            subtitle: 'Designed for a premium hackathon demo with strong visual hierarchy.',
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: MetricCard(
                  title: 'Resolved this week',
                  value: '128',
                  icon: Icons.check_circle_rounded,
                  color: AppColors.success,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(
                  title: 'Average response',
                  value: '4.2 hrs',
                  icon: Icons.timer_rounded,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const _InsightCard(),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary.withValues(alpha: 0.96), AppColors.secondary.withValues(alpha: 0.96)],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AI-Based Smart Grievance Management',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.tagline,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.92)),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: PrimaryActionButton(
                    label: 'Raise Complaint',
                    icon: Icons.add_circle_outline_rounded,
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.voiceComplaint),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SecondaryActionButton(
                    label: 'District Analytics',
                    icon: Icons.bar_chart_rounded,
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.analytics),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.09),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.primary),
              ),
              const Spacer(),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.insights_rounded, color: AppColors.accent),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI summarization highlights recurring issues',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'The frontend showcases smart prioritization and cross-service visibility.',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
