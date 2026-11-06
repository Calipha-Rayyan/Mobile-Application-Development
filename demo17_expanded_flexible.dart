// Slide 17: Expanded (flex) and Flexible.
// Run: flutter run -d chrome -t lib/demo17_expanded_flexible.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Demo())));

// Just a shortcut for the ElevatedButton you already know.
Widget btn(String label) =>
    ElevatedButton(onPressed: () {}, child: Text(label));

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('flex: the rest of the row is shared 1 : 2'),
        Row(
          children: [
            btn('Fixed'),
            Expanded(flex: 3, child: btn('flex 1')),
            Expanded(flex: 1, child: btn('flex 2')),
          ],
        ),
        const Text('Expanded: the button MUST fill its space'),
        Row(
          children: [
            Expanded(child: btn('Expanded')),
            btn('Fixed'),
          ],
        ),
        const Text('Flexible: the button MAY stay small'),
        Row(
          children: [
            Flexible(child: btn('Flexible')),
            btn('Fixed'),
          ],
        ),
      ],
    );
  }
}