import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class VoiceRecordingScreen extends StatelessWidget {
  const VoiceRecordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'Voice Complaint',
        subtitle: 'Capture the grievance using a premium voice-first flow.',
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
                    height: 88,
                    width: 88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.18),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.mic_rounded, color: Colors.white, size: 38),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tap to record your grievance',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This frontend uses a visual mock recording experience and routes to AI processing.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      12,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 350 + (index * 30)),
                          height: 18 + (index % 4) * 12,
                          width: 7,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.18 + (index % 3) * 0.08),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryActionButton(
                    label: 'Continue to AI Processing',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.aiProcessing),
                  ),
                  const SizedBox(height: 12),
                  SecondaryActionButton(
                    label: 'Use Text Instead',
                    icon: Icons.edit_note_rounded,
                    onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.textComplaint),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          const _StepsCard(),
        ],
      ),
    );
  }
}

class _StepsCard extends StatelessWidget {
  const _StepsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('What happens next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            SizedBox(height: 14),
            _StepItem(label: 'Speech to text conversion'),
            _StepItem(label: 'AI grievance summarization'),
            _StepItem(label: 'Auto-generated letter and token'),
          ],
        ),
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  const _StepItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
