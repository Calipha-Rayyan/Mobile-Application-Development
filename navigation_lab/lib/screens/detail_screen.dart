import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dish.name)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(dish.name, style: Theme.of(context).textTheme.headlineMedium),
            Text('Rs. ${dish.price}'),
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
