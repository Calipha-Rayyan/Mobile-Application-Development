import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Campus Bites v1.0'),
            const SizedBox(height: 16),
            Text('Can I pop? ${Navigator.canPop(context)}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Go back if there is a screen in history, otherwise return to home
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/');
                }
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
