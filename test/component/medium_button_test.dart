import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ripple_puzzle/core/style/app_color.dart';
import 'package:ripple_puzzle/presentation/component/medium_button.dart';

void main() {
  group('MediumButton Widget Tests', () {
    testWidgets('should render button with icon and text', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.settings;
      const testText = 'Settings';
      const testColor = AppColor.primary80;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
      const testIcon = Icons.info;
      const testText = 'Information';
      const testColor = AppColor.primary60;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
      await tester.tap(find.byType(MediumButton));
      await tester.pump();

      // Then
      expect(wasPressed, true);
    });

    testWidgets('should not call onPressed when onPressed is null', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.block;
      const testText = 'Disabled';
      const testColor = AppColor.gray2;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: null, // Disabled state
            ),
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.byType(MediumButton));
      await tester.pump();

      // Then - No exception should be thrown
      expect(find.byType(MediumButton), findsOneWidget);
    });

    testWidgets('should have correct container properties when enabled', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.favorite;
      const testText = 'Favorite';
      const testColor = AppColor.secondary100;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
          of: find.byType(MediumButton),
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
      const testIcon = Icons.warning;
      const testText = 'Warning';
      const testColor = AppColor.yellow;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
          of: find.byType(MediumButton),
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
      const testText = 'Star';
      const testColor = AppColor.textLightGreen;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
      const testIcon = Icons.cancel;
      const testText = 'Cancel';
      const testColor = AppColor.gray3;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
      const testIcon = Icons.menu;
      const testText = 'Menu';
      const testColor = AppColor.primary40;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
      const testIcon = Icons.edit;
      const testText = 'Edit';
      const testColor = AppColor.secondary80;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MediumButton(
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
          of: find.byType(MediumButton),
          matching: find.byType(Row),
        ),
      );

      expect(row.mainAxisAlignment, MainAxisAlignment.center);
      expect(row.children.length, 3); // Icon, SizedBox, Text
    });
  });
}