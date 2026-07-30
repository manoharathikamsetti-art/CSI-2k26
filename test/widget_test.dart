// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:csi_grievance/main.dart';
import 'package:csi_grievance/providers/app_state.dart';
import 'package:csi_grievance/providers/app_state_scope.dart';

void main() {
  testWidgets('shows the localized splash and language selection flow', (WidgetTester tester) async {
    await tester.pumpWidget(
      AppStateScope(
        appState: AppState(),
        child: const MyApp(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('ఏఐ ఆధారిత స్మార్ట్ ఫిర్యాదు ముసాయిదా'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('భాష ఎంపిక'), findsWidgets);
    expect(find.text('తెలుగు'), findsWidgets);
    expect(find.text('English'), findsWidgets);
  });
}
