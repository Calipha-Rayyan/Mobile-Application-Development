// Slide 18: Container: margin, decoration, padding.
// Run: flutter run -d chrome -t lib/demo18_container.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Demo())));

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(30), // space OUTSIDE the box
          padding: const EdgeInsets.all(30), // space INSIDE the box
  
          decoration: BoxDecoration(
            color: Colors.indigo, // the visible box
            border: Border.all(color: Colors.orange, width: 4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(onPressed: () {}, child: const Text('child')),
        ),
        // A neighbour, so you can see the margin pushing it away.
        Container(color: Colors.black12, child: const Text('neighbour')),
      ],
    );
  }
}

// Try, one at a time, with hot reload:
//   margin  -> EdgeInsets.all(0)     the neighbour moves up and touches the box
//   padding -> EdgeInsets.all(0)     the button hugs the orange border
//   padding -> EdgeInsets.symmetric(horizontal: 60, vertical: 10)
//   margin  -> EdgeInsets.only(left: 80)