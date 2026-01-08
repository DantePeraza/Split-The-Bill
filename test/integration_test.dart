import 'package:final_proj/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Happy Paths', () {
    testWidgets(
        "should compute per-person total (120, 15%, 3 people) = \$46.00",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // If you have a splash, give it a moment; otherwise this settles immediately.
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify we start on splash screen with correct text
      expect(find.text('Split the'), findsOneWidget);
      expect(find.text('Bill'), findsOneWidget);

      // Verify Get Started button exists and tap it
      final startBtn = find.text('Get Started');
      expect(startBtn, findsOneWidget);
      await tester.tap(startBtn);
      await tester.pumpAndSettle();

      // Enter Total Amount
      expect(find.text('Enter Total'), findsWidgets);
      await tester.enterText(find.byType(TextField), '120');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Tip Percentage
      expect(find.text('Tip Percentage'), findsWidgets);
      // Clear existing text and enter new value
      await tester.enterText(find.byType(TextField), '15');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Party Size - Check for dropdown or text field
      expect(find.text('Party Size'), findsWidgets);

      // Try dropdown first
      var dropdownFinder = find.byType(DropdownButton<int>);
      if (dropdownFinder.evaluate().isNotEmpty) {
        await tester.tap(dropdownFinder);
        await tester.pumpAndSettle();
        // Select 3 people
        await tester.tap(find.text('3 people'));
        await tester.pumpAndSettle();
      } else {
        // Fallback to text field
        await tester.enterText(find.byType(TextField), '3');
        await tester.pumpAndSettle();
      }

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Total Per Person
      expect(find.text('Total Per Person'), findsWidgets);

      // Expect one of the rows to show $46.00 (120 * 1.15 = 138; /3 = 46.00)
      expect(find.text('\$46.00'), findsOneWidget);

      // If you have a "Done" button like in the mock:
      final doneBtn = find.text('Done');
      if (doneBtn.evaluate().isNotEmpty) {
        expect(doneBtn, findsOneWidget);
      }
    });
  });

  group('Sad Paths', () {
    testWidgets("should not advance from Enter Total without a value",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify we start on splash screen
      expect(find.text('Split the'), findsOneWidget);
      expect(find.text('Bill'), findsOneWidget);

      // Tap Get Started button to navigate to Enter Total screen
      final startBtn = find.text('Get Started');
      expect(startBtn, findsOneWidget);
      await tester.tap(startBtn);
      await tester.pumpAndSettle();

      // On Enter Total with empty input, try to continue
      expect(find.text('Enter Total'), findsWidgets);
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Still on the same screen
      expect(find.text('Enter Total'), findsWidgets);
    });

    testWidgets("should not advance from Tip Percentage without a tip",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify we start on splash screen
      expect(find.text('Split the'), findsOneWidget);
      expect(find.text('Bill'), findsOneWidget);

      // Tap Get Started button to navigate to Enter Total screen
      final startBtn = find.text('Get Started');
      expect(startBtn, findsOneWidget);
      await tester.tap(startBtn);
      await tester.pumpAndSettle();

      // Enter Total
      await tester.enterText(find.byType(TextField), '120');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Tip screen: clear and attempt to continue with empty input
      expect(find.text('Tip Percentage'), findsWidgets);
      await tester.enterText(find.byType(TextField), '');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Should still be on Tip Percentage
      expect(find.text('Tip Percentage'), findsWidgets);
    });
  });
}
