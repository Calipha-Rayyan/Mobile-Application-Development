// Slide 15 (right picture): the six values of mainAxisAlignment, in a ROW.
// Run: flutter run -d chrome -t lib/demo15b_row_main_axis.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Demo())));

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // one Text + one Row for each of the six values
        for (final m in MainAxisAlignment.values) ...[
          Text(m.name),
          Row(
            mainAxisAlignment: m, // <-- the only line that differs
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('A')),
              ElevatedButton(onPressed: () {}, child: const Text('B')),
              ElevatedButton(onPressed: () {}, child: const Text('C')),
            ],
          ),
        ],
      ],
    );
  }
}