import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_provider.dart';

/// Shows the same cart count wherever this widget is placed.
class CartBadge extends ConsumerWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Badge(
      label: Text('${cart.length}'),
      child: const Icon(Icons.shopping_cart),
    );
  }
}
