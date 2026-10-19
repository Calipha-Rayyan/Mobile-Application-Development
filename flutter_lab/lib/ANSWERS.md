# Study Tracker Lab — Answers

**Name:** Muhammad Rayyan Bhatti  
**Roll Number:** 04072312024

## Numerical Answers

**A1: 6**  
Starting from 7, each tap adds 3. The count goes 7, 10, 13, 16, 19, 22, and then reaches the maximum of 24 on the sixth tap.

**A2: 12**  
The countdown shows its first value during the initial build. It then rebuilds once for each of the 11 one-second ticks, including the tick that displays “Time is up!”. That makes 12 builds altogether.

**A3: 3**  
With the bug still present, three taps increase `_clicks` internally to 3, but the screen keeps showing 0 because the callback does not call `setState()`.

**A4: 29**  
The starting progress is 7 out of 24. Using integer division, `7 * 100 ~/ 24` gives 29.

## Written Answers

**B1: Which classes are Stateless and which are Stateful, and why?**  
`LabApp`, `HomePage`, `StudentCard`, and `GoalBanner` are Stateless widgets because they display the app structure or values passed into them and do not manage changing data of their own. `Tally`, `Countdown`, and `BuggyCounter` are Stateful widgets because their screens need to update when the count changes, the timer ticks, or the button is pressed.

**B2: Why must the Timer be cancelled in `dispose()`?**  
The timer should be cancelled when the countdown widget is removed. Otherwise, it could keep running and try to call `setState()` after the widget has been disposed, causing an error and wasting resources.

**B3: Which widgets in your code can be `const`, and what does `const` provide?**  
I can use `const` when a widget supports a const constructor and all its arguments are known at compile time. Examples in this app include `MaterialApp`, `HomePage`, `Tally`, `Countdown`, `BuggyCounter`, fixed `SizedBox` widgets, `Text('Reset')`, and the required `Key` objects. The `StudentCard` and `GoalBanner` use values that are passed in at runtime, so those instances are not const here. Using `const` makes it clear that a widget's configuration will not change and lets Flutter reuse constant widget instances instead of creating new ones unnecessarily.
