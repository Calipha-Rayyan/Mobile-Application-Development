# CS 442 - State Management and REST APIs
## Easy answers to the lab questions

These answers follow the attached **State and REST Lab Guide** and **Week 9 - State Management & REST APIs** lecture slides.

---

## Q1. Why is `setState` not enough for the shared cart?

**(a) What does Home show after pressing Add to cart three times? Where is 3 stored?**

The Home cart icon still shows **0**. The number 3 is stored in `_added` inside the Detail screen's own State object. `setState` rebuilds only that Detail screen. Home has a separate widget and cannot see the Detail screen's private number. When Detail is closed, its State object is destroyed, so that number is lost.

**(b) Give one other way to share the number and one cost of that way.**

Use **lifting state up**: keep the cart value in a parent widget above both screens, pass the value down through constructors, and pass a callback up when a child wants to change it.

The disadvantage is that every widget between the parent and the screen must pass the value and callback along, even if it does not use them. If the widget structure changes, many constructors may need editing.

## Q2. Riverpod counter

**(a) Fill in the blanks.**

- The number lives in the **Notifier** (`CounterNotifier`).
- A widget finds it through the **provider** (`counterProvider`).
- To show the number, use `ref.watch`.
- To change it, the button uses:

```dart
ref.read(counterProvider.notifier).increment();
```

So the missing words are: **Notifier, provider, watch, read, notifier**.

**(b) What happens if `ref.watch` is changed to `ref.read` inside `build`?**

The number on the screen does not update when the `+` button is pressed. `ref.read` gets the current value once but does not listen for changes. `ref.watch` listens, so Flutter rebuilds the widget when the number changes.

## Q3. Why must we replace the cart list?

**(a) What happens when `state.add(dish)` is used?**

The cart badge normally stays at its old number. The list is changed in place, but Riverpod is not given a new state value, so the widgets watching the cart are not told to rebuild.

**(b) Why does this happen?**

`state.add(dish)` changes the existing list object. It does not assign a new list to `state`. Riverpod needs a new state assignment to notify the widgets that watch the provider.

**(c) Write the correct line.**

```dart
state = [...state, dish];
```

This makes a new list, copies the old items into it, adds the new dish, and assigns that new list to `state`.

## Q4. REST API in the browser

**(a) Does `/posts` start with `{` or `[`? How many posts are there?**

It starts with **`[`** because the response is a list (array) of posts. There are **100 posts**, with IDs from 1 to 100.

**(b) What is the status code for `/posts/9999`? Which family is it, and who made the mistake?**

The status code is **404 Not Found**. It belongs to the **4xx** family. The request asked for a post that does not exist, so it is a client/request-side problem rather than a server failure.

**(c) Which HTTP method is used to read, create, and delete a post?**

- Read a post: **GET**
- Create a post: **POST**
- Delete a post: **DELETE**

## Q5. JSON in Dart

**(a) What do the four print statements show?**

The output is:

```text
sunt aut facere
2
null
b
```

Explanation:

1. `map['title']` finds the title, so it prints `sunt aut facere`.
2. `map['id'] + 1` adds 1 to the number 1, so it prints `2`.
3. `map['titel']` uses the wrong spelling. That key does not exist, so it prints `null`.
4. `map['tags'][1]` gets item number 1 (the second item) from the list `['a', 'b']`, so it prints `b`.

**(b) Why does the misspelled key not crash immediately, and why is it dangerous?**

A missing key in a Dart Map returns `null`. It does not automatically show an error. This is dangerous because the program may later use that `null` as though it were a real title or another required value. That can display missing data or cause an error somewhere else in the app.

---

## Extra questions and checks from the slides and lab guide

### Week 9 warm-up questions

1. **`go` or `push`?** Usually use `go` to move to a top-level destination such as Settings. Use `push` to open a detail page from a list when the Back button should return to that list. The exact choice depends on the navigation flow the app is designed to have.
2. **What does `:id` mean in `/detail/:id`?** It is a path-parameter placeholder. The app puts a real ID there, for example `/detail/12`.
3. **Why did `MyApp` become Stateful for dark mode?** Because the selected `ThemeMode` changes while the app is running. `MyApp` owns that value, and `setState` rebuilds the app with the new theme.

### Riverpod and cart checks

- **Why use `add()` in `CartNotifier`?** It keeps the cart-changing logic in one place. Screens ask the notifier to add a dish instead of each screen editing the list in its own way.
- **Why use `ref.watch` in a widget's `build` method?** It reads the provider and listens for changes, so the widget rebuilds when the value changes.
- **Why use `ref.read` inside a button callback?** A button performs an action. It needs to call a notifier method, not listen for changes just to perform that action.
- **Why does the cart become empty after a full restart?** The lab keeps the cart in memory inside `ProviderScope`. It does not save the cart to a database or local storage.

### Optional REST API checks

- **What is nested inside `/users/1`?** The `address` is an object inside the user object. It contains fields such as `street`, `suite`, `city`, `zipcode`, and a nested `geo` object.
- **What does `/posts?userId=1` do?** It filters the posts and returns only posts whose `userId` is 1. The practice API currently returns **10 posts** for this query.
- **What does `/posts/1/comments` request?** It requests the comments that belong to post number 1.

### Optional JSON type check

If the JSON changes from `"id": 1` to `"id": "1"`, the ID becomes a String instead of a number. The expression `map['id'] + 1` then causes a runtime type error because Dart cannot add an integer to that String.

---

## Important code rules to remember

1. `ProviderScope` goes near the top of the app, around `MyApp`.
2. A `Notifier` owns the state and the methods that change it.
3. A provider is the handle widgets use to find that state.
4. Use `ref.watch` to display provider data and listen for updates.
5. Use `ref.read(provider.notifier)` to call an action.
6. Create and assign a new list: `state = [...state, dish]`. Do not mutate the old list with `state.add(dish)`.
7. JSON objects become Dart Maps; JSON arrays become Dart Lists after `jsonDecode`.
