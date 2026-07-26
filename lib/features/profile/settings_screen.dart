import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _voiceAssist = true;
  bool _autoTranslate = true;

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Settings',
        subtitle: 'Personalize the grievance experience.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  value: _notifications,
                  onChanged: (value) => setState(() => _notifications = value),
                  title: const Text('Notifications'),
                  subtitle: const Text('Receive tracking and update alerts'),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: _voiceAssist,
                  onChanged: (value) => setState(() => _voiceAssist = value),
                  title: const Text('Voice Assist'),
                  subtitle: const Text('Enable speech-first complaint flow'),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: _autoTranslate,
                  onChanged: (value) => setState(() => _autoTranslate = value),
                  title: const Text('Auto Translation'),
                  subtitle: const Text('Translate text to preferred language'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Theme', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: const [
                      _ThemeChip(label: 'Government Blue', selected: true),
                      _ThemeChip(label: 'High Contrast', selected: false),
                      _ThemeChip(label: 'Accessibility Mode', selected: false),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryActionButton(
            label: 'Save Settings',
            icon: Icons.save_rounded,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ThemeChip extends StatelessWidget {
  const _ThemeChip({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      side: BorderSide(color: selected ? AppColors.primary : AppColors.border),
      backgroundColor: selected ? AppColors.primary.withValues(alpha: 0.1) : Colors.white,
    );
  }
}
