
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, this.mode = ThemeMode.light, this.onMode});

  final ThemeMode mode;
  final ValueChanged<ThemeMode>? onMode; // told when the switch moves

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // This screen keeps its own copy, so the switch moves the moment it is tapped.
  late ThemeMode _mode = widget.mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Dark mode'),
              value: _mode == ThemeMode.dark,
              onChanged: (on) {
                final mode = on ? ThemeMode.dark : ThemeMode.light;
                setState(() => _mode = mode);
                widget.onMode?.call(mode);
              },
            ),
            const SizedBox(height: 16),
            Text('Can I pop? ${Navigator.canPop(context)}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO block 3: go back to the menu
                context.go('/');
              },
              child: const Text('Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
