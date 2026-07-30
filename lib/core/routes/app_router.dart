import 'package:flutter/material.dart';

import '../../features/citizen/citizen_home_screen.dart';
import '../../features/complaint/generated_application_screen.dart';
import '../../features/complaint/text_complaint_screen.dart';
import '../../features/complaint/voice_recording_screen.dart';
import '../../features/language/language_selection_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../models/generated_letter.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _route(const SplashScreen(), settings);
      case AppRoutes.language:
        return _route(const LanguageSelectionScreen(), settings);
      case AppRoutes.home:
        return _route(const CitizenHomeScreen(), settings);
      case AppRoutes.voiceComplaint:
        return _route(const VoiceRecordingScreen(), settings);
      case AppRoutes.textComplaint:
        return _route(const TextComplaintScreen(), settings);
      case AppRoutes.generatedLetter:
        return _route(
          GeneratedApplicationScreen(draft: settings.arguments as GeneratedLetter?),
          settings,
        );
      default:
        return _route(const SplashScreen(), settings);
    }
  }

  static PageRouteBuilder<dynamic> _route(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.06, 0.08),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    );
  }
}
