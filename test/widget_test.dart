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

  testWidgets('FAB has tooltip for accessibility', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Find the FAB
    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);

    // Verify the FAB has a tooltip
    final FloatingActionButton fabWidget = tester.widget(fab);
    expect(fabWidget.tooltip, equals('Adicionar tarefa'));
  });

  testWidgets('Empty state has semantic information', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Verify empty state is displayed
    expect(find.text('Nenhuma tarefa adicionada'), findsOneWidget);

    // Verify instruction text is present
    expect(
      find.text('Clique no botão + para adicionar uma nova tarefa'),
      findsOneWidget,
    );
  });

  testWidgets('AppBar title is present', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify app bar title
    expect(find.text('Gerenciador de Tarefas'), findsOneWidget);
  });

  testWidgets('Add task dialog has proper labels', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Tap the FAB to open the dialog
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify dialog title
    expect(find.text('Nova Tarefa'), findsOneWidget);

    // Verify form fields have labels (labelText)
    expect(find.text('Título da tarefa'), findsOneWidget);
    expect(find.text('Descrição'), findsOneWidget);

    // Verify action buttons
    expect(find.text('Cancelar'), findsOneWidget);
    expect(find.text('Adicionar'), findsOneWidget);
  });

  testWidgets('Add task dialog shows error when title is empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Tap the FAB to open the dialog
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Tap Adicionar without entering a title
    await tester.tap(find.text('Adicionar'));
    await tester.pumpAndSettle();

    // Verify error message is displayed
    expect(find.text('Por favor, insira um título'), findsOneWidget);
  });
}
