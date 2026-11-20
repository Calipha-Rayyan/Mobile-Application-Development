# Campus Bites - Riverpod and REST Lab

This is the updated `lib` folder for the CS 442 State Management and REST lab.

## 1. Install Riverpod in your existing Flutter project

Open the terminal in the folder that contains your existing `pubspec.yaml`, then run:

```bash
flutter pub add flutter_riverpod
```

The starter ZIP did not include `pubspec.yaml`, so keep your existing one. Do not replace it with a new file.

## 2. Copy the updated files

Copy all files from this ZIP's `lib` folder into your Flutter project's `lib` folder. Replace the older files when VS Code asks.

The final `lib` folder contains:

- `main.dart` - starts the app inside `ProviderScope`.
- `data.dart` - the five Campus Bites dishes from the starter project.
- `home_screen.dart` - displays the dishes and shared cart badge.
- `detail_screen.dart` - adds the selected dish to the shared cart.
- `cart_provider.dart` - stores and updates the shared cart.
- `cart_badge.dart` - watches the cart and displays its item count.
- `counter_page.dart` - optional counter example for Riverpod practice.
- `json_demo.dart` - optional JSON decoding example.

## 3. Run the app

Stop any old running app, then run:

```bash
flutter run -d chrome
```

You can also press F5 in VS Code and choose Chrome. After adding a new package, restart the app instead of relying on hot reload.

## 4. Test the shared cart

1. Open Garden Salad.
2. Press **Add to cart** two times.
3. The cart badge on Detail should show `2`.
4. Go back to Home. Its badge should also show `2`.
5. Open Karak Chai and add it once. Both screens should show `3`.

The cart is stored in memory. It starts empty again after a full app restart because this lab does not add database or local-storage persistence.

## 5. Open the optional examples

- To try the counter, temporarily change `home: const HomeScreen()` in `main.dart` to `home: const CounterPage()` and import `counter_page.dart`.
- To run the JSON example, use `dart run lib/json_demo.dart` from the project root, or copy its code into DartPad.

To return to the Campus Bites app, switch `home` back to `HomeScreen`.
