import 'package:flutter/material.dart';
import 'package:ripple_puzzle/core/style/app_color.dart';
import 'package:ripple_puzzle/presentation/component/large_button.dart';
import 'package:ripple_puzzle/presentation/component/medium_button.dart';
import 'package:ripple_puzzle/presentation/component/small_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ripple Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.primary20,
      ),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Demo'),
        backgroundColor: AppColor.primary100,
        foregroundColor: AppColor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LargeButton(
              backGroundColor: AppColor.primary80,
              icon: Icons.play_arrow,
              text: 'Large Button',
              onPressed: () {
                print('Large Button Pressed!');
              },
            ),
            const SizedBox(height: 16),
            MediumButton(
              backGroundColor: AppColor.primary60,
              icon: Icons.settings,
              text: 'Medium Button',
              onPressed: () {
                print('Medium Button Pressed!');
              },
            ),
            const SizedBox(height: 16),
            SmallButton(
              backGroundColor: AppColor.primary40,
              icon: Icons.lock,
              text: 'Small Button',
              onPressed: () {
                print('Small Button Pressed!');
              },
            ),
          ],
        ),
      ),
    );
  }
}