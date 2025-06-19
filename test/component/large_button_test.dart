import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ripple_puzzle/core/style/app_color.dart';
import 'package:ripple_puzzle/presentation/component/large_button.dart';

void main() {
  group('LargeButton Widget Tests', () {
    testWidgets('should render button with icon and text', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.play_arrow;
      const testText = 'Test Button';
      const testColor = AppColor.primary100;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Then
      expect(find.byIcon(testIcon), findsOneWidget);
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (WidgetTester tester) async {
      // Given
      bool wasPressed = false;
      const testIcon = Icons.settings;
      const testText = 'Settings';
      const testColor = AppColor.primary80;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.byType(LargeButton));
      await tester.pump();

      // Then
      expect(wasPressed, true);
    });

    testWidgets('should not call onPressed when onPressed is null', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.lock;
      const testText = 'Disabled';
      const testColor = AppColor.gray3;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: null, // Disabled state
            ),
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.byType(LargeButton));
      await tester.pump();

      // Then - No exception should be thrown
      expect(find.byType(LargeButton), findsOneWidget);
    });

    testWidgets('should have correct container properties when enabled', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.add;
      const testText = 'Add Item';
      const testColor = AppColor.secondary100;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Then
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(LargeButton),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, testColor);
      expect(decoration.borderRadius, BorderRadius.circular(16));
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, 1);
    });

    testWidgets('should have reduced opacity when disabled', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.delete;
      const testText = 'Delete';
      const testColor = AppColor.yellow;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: null, // Disabled
            ),
          ),
        ),
      );

      // Then
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(LargeButton),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      
      expect(decoration.color, testColor.withOpacity(0.5));
      expect(decoration.boxShadow, isNull);
    });

    testWidgets('should have correct icon color when enabled', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.star;
      const testText = 'Favorite';
      const testColor = AppColor.yellow;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Then
      final icon = tester.widget<Icon>(find.byIcon(testIcon));
      expect(icon.color, AppColor.white);
    });

    testWidgets('should have reduced icon opacity when disabled', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.block;
      const testText = 'Blocked';
      const testColor = AppColor.gray2;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: null,
            ),
          ),
        ),
      );

      // Then
      final icon = tester.widget<Icon>(find.byIcon(testIcon));
      expect(icon.color, AppColor.white.withOpacity(0.6));
    });

    testWidgets('should find GestureDetector widget', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.home;
      const testText = 'Home';
      const testColor = AppColor.primary60;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Then
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('should have correct Row layout', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.logout;
      const testText = 'Logout';
      const testColor = AppColor.yellow;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LargeButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Then
      final row = tester.widget<Row>(
        find.descendant(
          of: find.byType(LargeButton),
          matching: find.byType(Row),
        ),
      );

      expect(row.mainAxisAlignment, MainAxisAlignment.center);
      expect(row.children.length, 3); // Icon, SizedBox, Text
    });
  });
}