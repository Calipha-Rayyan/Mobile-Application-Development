import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_badge.dart';
import 'cart_provider.dart';
import 'data.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dish.name),
        actions: const [
          CartBadge(),
          SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rs ${dish.price}',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.read(cartProvider.notifier).add(dish),
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
