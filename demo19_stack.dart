// Slide 19: Stack and Positioned.
// Run: flutter run -d chrome -t lib/demo19_stack.dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: Demo())));

// A coloured, labelled rectangle.
Widget layer(String label, Color color, double w, double h) => Container(
      width: w,
      height: h,
      color: color,
      padding: const EdgeInsets.all(8),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // 1: not positioned -> sets the size of the Stack, sits at top-left
          layer('1 Sun', Colors.indigo, 350, 250),
          // 2: positioned -> 60 px from the top, 60 px from the left
          Positioned(
            top: 60,
            left: 30,
            child: layer('2 Clouds', Colors.lightBlue, 200, 120),
          ),
          // 3: last child -> painted on top of everything
          Positioned(
            top: 120,
            right: 20,
           
            child: layer('3 Content', Colors.deepOrange, 200, 100),
          ),
        ],
      ),

    );
  }
}

// Try, one at a time, with hot reload:
//   move the "2 Clouds" Positioned to the top of the list  -> it goes UNDER the Sun
//   change top / left / right / bottom numbers             -> the layers move
//   put "3 Content" first in the list                      -> it disappears behind the others