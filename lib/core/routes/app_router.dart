import 'package:flutter/material.dart';

import '../../features/analytics/analytics_dashboard_screen.dart';
import '../../features/citizen/citizen_home_screen.dart';
import '../../features/complaint/ai_processing_screen.dart';
import '../../features/complaint/complaint_details_screen.dart';
import '../../features/complaint/complaint_summary_screen.dart';
import '../../features/complaint/generated_application_screen.dart';
import '../../features/complaint/text_complaint_screen.dart';
import '../../features/complaint/token_screen.dart';
import '../../features/complaint/voice_recording_screen.dart';
import '../../features/history/complaint_history_screen.dart';
import '../../features/language/language_selection_screen.dart';
import '../../features/officer/officer_login_screen.dart';
import '../../features/officer/officer_dashboard_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/profile/settings_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _route(const SplashScreen(), settings);
      case AppRoutes.language:
        return _route(const LanguageSelectionScreen(), settings);
      case AppRoutes.citizenHome:
        return _route(const CitizenHomeScreen(), settings);
      case AppRoutes.voiceComplaint:
        return _route(const VoiceRecordingScreen(), settings);
      case AppRoutes.textComplaint:
        return _route(const TextComplaintScreen(), settings);
      case AppRoutes.aiProcessing:
        return _route(const AiProcessingScreen(), settings);
      case AppRoutes.generatedApplication:
        return _route(const GeneratedApplicationScreen(), settings);
      case AppRoutes.complaintSummary:
        return _route(const ComplaintSummaryScreen(), settings);
      case AppRoutes.token:
        return _route(const TokenScreen(), settings);
      case AppRoutes.complaintHistory:
        return _route(const ComplaintHistoryScreen(), settings);
      case AppRoutes.officerLogin:
        return _route(const OfficerLoginScreen(), settings);
      case AppRoutes.officerDashboard:
        return _route(const OfficerDashboardScreen(), settings);
      case AppRoutes.complaintDetails:
        return _route(const ComplaintDetailsScreen(), settings);
      case AppRoutes.analytics:
        return _route(const AnalyticsDashboardScreen(), settings);
      case AppRoutes.profile:
        return _route(const ProfileScreen(), settings);
      case AppRoutes.settings:
        return _route(const SettingsScreen(), settings);
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
