import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:basic_loading_overlay/basic_loading_overlay.dart';

void main() {
  testWidgets(
    'should display loading overlay',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Placeholder(),
          ),
        ),
      );

      final context = tester.element(
        find.byType(Placeholder),
      );

      LoadingOverlay.show(
        context: context,
      );

      await tester.pump();

      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'should dismiss loading overlay',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Placeholder(),
          ),
        ),
      );

      final context = tester.element(
        find.byType(Placeholder),
      );

      LoadingOverlay.show(
        context: context,
      );

      await tester.pump();

      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );

      Navigator.of(context).pop();

      await tester.pumpAndSettle();

      expect(
        find.byType(CircularProgressIndicator),
        findsNothing,
      );
    },
  );

  testWidgets(
    'should apply custom parameters',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Placeholder(),
          ),
        ),
      );

      final context = tester.element(
        find.byType(Placeholder),
      );

      LoadingOverlay.show(
        context: context,
        loadingIndicatorColor: Colors.redAccent,
        strokeWidth: 6,
      );

      await tester.pump();

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );

      expect(
        indicator.color,
        Colors.redAccent,
      );

      expect(
        indicator.strokeWidth,
        6,
      );
    },
  );
}
