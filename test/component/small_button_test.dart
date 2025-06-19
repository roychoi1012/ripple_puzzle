import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ripple_puzzle/core/style/app_color.dart';
import 'package:ripple_puzzle/presentation/component/small_button.dart';

void main() {
  group('SmallButton Widget Tests', () {
    testWidgets('should render button with icon and text', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.add;
      const testText = 'Add';
      const testColor = AppColor.primary60;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
      const testIcon = Icons.help;
      const testText = 'Help';
      const testColor = AppColor.secondary60;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
      await tester.tap(find.byType(SmallButton));
      await tester.pump();

      // Then
      expect(wasPressed, true);
    });

    testWidgets('should not call onPressed when onPressed is null', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.lock_outline;
      const testText = 'Locked';
      const testColor = AppColor.gray1;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: null, // Disabled state
            ),
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.byType(SmallButton));
      await tester.pump();

      // Then - No exception should be thrown
      expect(find.byType(SmallButton), findsOneWidget);
    });

    testWidgets('should have correct container properties when enabled', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.download;
      const testText = 'Download';
      const testColor = AppColor.textBlue;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
          of: find.byType(SmallButton),
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
      const testIcon = Icons.close;
      const testText = 'Close';
      const testColor = AppColor.textLavender;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
          of: find.byType(SmallButton),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      
      expect(decoration.color, testColor.withOpacity(0.5));
      expect(decoration.boxShadow, isNull);
    });

    testWidgets('should have correct icon color when enabled', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.check;
      const testText = 'Check';
      const testColor = AppColor.secondary40;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
      const testIcon = Icons.disabled_by_default;
      const testText = 'Disabled';
      const testColor = AppColor.gray4;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
      const testIcon = Icons.search;
      const testText = 'Search';
      const testColor = AppColor.primary20;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
      const testIcon = Icons.share;
      const testText = 'Share';
      const testColor = AppColor.secondary20;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
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
          of: find.byType(SmallButton),
          matching: find.byType(Row),
        ),
      );

      expect(row.mainAxisAlignment, MainAxisAlignment.center);
      expect(row.children.length, 3); // Icon, SizedBox, Text
    });

    testWidgets('should use correct text style - smallTextBold', (WidgetTester tester) async {
      // Given
      const testIcon = Icons.text_format;
      const testText = 'Text Style Test';
      const testColor = AppColor.yellow;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SmallButton(
              icon: testIcon,
              text: testText,
              backGroundColor: testColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Then
      final text = tester.widget<Text>(find.text(testText));
      
      // smallTextBold의 fontSize는 14이고 fontWeight는 FontWeight.bold
      expect(text.style!.fontSize, 14);
      expect(text.style!.fontWeight, FontWeight.bold);
    });
  });
}