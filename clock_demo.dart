import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(body: Center(child: Clock())),
      ),
    );

class Clock extends StatefulWidget {
  const Clock({super.key});
  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {}),
    );
  }

  @override
  void dispose() {
    _timer.cancel();   // stop the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = DateTime.now().toString();
    return Text(t.substring(11, 19),
        style: const TextStyle(fontSize: 48));
  }
}
