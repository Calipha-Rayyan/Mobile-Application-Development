
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import '../data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Bites')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (var i = 0; i < dishes.length; i++)
                  ListTile(
                    title: Text(dishes[i].name),
                    subtitle: Text('Rs. ${dishes[i].price}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // TODO block 2: open the detail page for dishes[i]
                      context.push('/detail/$i');
                    },
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // TODO block 3: open the settings page
                    context.go('/settings');
                  },
                  child: const Text('Settings'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // TODO block 3: open the about page
                    context.push('/about');
                  },
                  child: const Text('About'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
