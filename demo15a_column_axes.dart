// Slide 15 (left picture): main axis vs cross axis in a COLUMN.
// Run: flutter run -d chrome -t lib/demo15a_column_axes.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Demo())));

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // MAIN axis = up/down
      crossAxisAlignment: CrossAxisAlignment.stretch, // CROSS axis = left/right
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('child 1')),
        ElevatedButton(onPressed: () {}, child: const Text('child 2')),
        ElevatedButton(onPressed: () {}, child: const Text('child 3')),
      ],
    );
  }
}
// Try: mainAxisAlignment -> start / end / spaceEvenly
//      crossAxisAlignment -> center / end / stretch