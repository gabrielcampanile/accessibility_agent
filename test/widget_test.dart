// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:accessibility_agent/main.dart';

void main() {
  testWidgets('Task Manager app loads successfully', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app loads without errors
    expect(find.byType(MyApp), findsOneWidget);

    // Verify that Material App is rendered
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
