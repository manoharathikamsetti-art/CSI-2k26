import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/app_widgets.dart';

class AiProcessingScreen extends StatefulWidget {
  const AiProcessingScreen({super.key});

  @override
  State<AiProcessingScreen> createState() => _AiProcessingScreenState();
}

class _AiProcessingScreenState extends State<AiProcessingScreen> {
  Timer? _timer;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;
      setState(() {
        _progress = (_progress + 0.18).clamp(0, 1);
      });
      if (_progress >= 1) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, AppRoutes.generatedApplication);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GovernmentScaffold(
      appBar: CustomAppBar(
        title: 'AI Processing',
        subtitle: 'Parsing, classifying and generating the grievance letter.',
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const LoadingIndicator(label: 'Analyzing your complaint'),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  LinearProgressIndicator(value: _progress),
                  const SizedBox(height: 16),
                  _ProcessStep(title: 'Speech / text ingestion', done: _progress > 0.2),
                  _ProcessStep(title: 'Department classification', done: _progress > 0.4),
                  _ProcessStep(title: 'Priority estimation', done: _progress > 0.6),
                  _ProcessStep(title: 'Letter generation', done: _progress > 0.8),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SecondaryActionButton(
            label: 'Continue manually',
            icon: Icons.arrow_forward_rounded,
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.generatedApplication),
          ),
        ],
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  const _ProcessStep({required this.title, required this.done});

  final String title;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        done ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
        color: done ? AppColors.success : AppColors.textSecondary,
      ),
      title: Text(title),
    );
  }
}
