import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data.dart';

/// Keeps the shared shopping cart outside the widget tree.
class CartNotifier extends Notifier<List<Dish>> {
  @override
  List<Dish> build() => [];

  /// Adds a dish by assigning a NEW list to state.
  void add(Dish dish) {
    state = [...state, dish];
  }

  /// Removes every dish from the cart.
  void clear() {
    state = [];
  }
}

/// Widgets use this provider to read or update the shared cart.
final cartProvider =
    NotifierProvider<CartNotifier, List<Dish>>(CartNotifier.new);
