// Slide 16: Overflow, and the Expanded fix.
// Run: flutter run -d chrome -t lib/demo16_overflow.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Demo())));

const longText = 'This label is very, very long and will not fit on one line';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('BROKEN: three long buttons in a Row'),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text(longText)),
            ElevatedButton(onPressed: () {}, child: const Text(longText)),
            ElevatedButton(onPressed: () {}, child: const Text(longText)),
          ],
        ),
        const Text('FIXED: each button wrapped in Expanded (text wraps)'),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(onPressed: () {}, child: const Text(longText)),
            ),
            Expanded(
              child: ElevatedButton(onPressed: () {}, child: const Text(longText)),
            ),
            Expanded(
              child: ElevatedButton(onPressed: () {}, child: const Text(longText)),
            ),
          ],
        ),
      ],
    );
  }
}