# CS442 Week 7 — Team Board Lab

**Name:** Muhammad Rayyan Bhatti  
**Roll Number:** 04072312024

## Numerical Answers

A1: 23  
A2: 5  
A3: 4  
A4: 75

## Written Answers

### B1: Stateless and Stateful classes

The StatelessWidget classes are `LabApp`, `HomePage`, `SettingsCard`, `SummaryRow`, `Probe`, `Welcome`, `InfoPanel`, `ShareRow`, `InfoBox`, and `StampStack`. They describe the UI but do not manage changing local state of their own.

The StatefulWidget classes are `Clock`, `Tile`, and `SwapBoard`, with their corresponding State classes `_ClockState`, `_TileState`, and `_SwapBoardState`. They need state because the clock and build counter change, tile tap counts increase, and the tile order changes when Swap is pressed.

### B2: Widget, Element, and RenderObject

Widget objects describe the UI and can be recreated during a rebuild. Elements maintain the widgets' positions and lifecycle in the widget tree, while compatible RenderObjects are generally retained and updated to handle layout, painting, and hit testing. In `Probe`, the Widget identity changed when the clock rebuilt, while the Element identity stayed the same. The context type was `Probe`, and the Scaffold check was `true`.

### B3: “Constraints go down, sizes go up”

In Step 7, the Row gave each `Expanded` child a limited share of the available width. The constraints went down from the Row to each child. Each Text then wrapped its words within that width and reported the height it needed back up the tree. This fixed the overflow because the text no longer tried to use more horizontal space than the Row had available.
