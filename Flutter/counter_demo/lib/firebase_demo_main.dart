// Firebase Auth + Firestore + Riverpod + Freezed, in one file.
// Setup (see Firebase_Setup_Checklist.docx), then:
//   flutter pub add firebase_core firebase_auth cloud_firestore flutter_riverpod freezed_annotation json_annotation
//   flutter pub add --dev build_runner freezed json_serializable
//   flutterfire configure          (creates lib/firebase_options.dart)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MaterialApp(home: AuthGate())));
}

// ---- Auth: a stream of "who is signed in" ----
final authStateProvider = StreamProvider<User?>(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);
    return auth.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (user) => user == null ? const LoginScreen() : const TasksScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _error;

  Future<void> _run(Future<void> Function() action) async {
    try {
      await action();
    } on FirebaseAuthException catch (e) {
      setState(() => _error = e.code); // e.g. wrong-password, weak-password
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _run(() => auth.signInWithEmailAndPassword(
                      email: _email.text.trim(), password: _password.text)),
                  child: const Text('Sign in'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => _run(() =>
                      auth.createUserWithEmailAndPassword(
                          email: _email.text.trim(), password: _password.text)),
                  child: const Text('Sign up'),
                ),
              ],
            ),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

// ---- Firestore: users/{uid}/tasks/{taskId} ----
CollectionReference<Map<String, dynamic>> _tasksCol() {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('tasks');
}

class TaskRepository {
  Stream<List<Task>> watchTasks() => _tasksCol().snapshots().map(
        (snap) => snap.docs.map((d) => Task.fromJson(d.data())).toList(),
      );

  Future<void> add(String title) {
    final doc = _tasksCol().doc(); // makes a new id
    return doc.set(Task(id: doc.id, title: title).toJson());
  }

  Future<void> setDone(Task t, bool done) =>
      _tasksCol().doc(t.id).update({'done': done});

  Future<void> remove(Task t) => _tasksCol().doc(t.id).delete();
}

final taskRepoProvider = Provider((ref) => TaskRepository());

final tasksProvider = StreamProvider<List<Task>>((ref) {
  ref.watch(authStateProvider); // restart the stream if the user changes
  return ref.watch(taskRepoProvider).watchTasks();
});

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    final repo = ref.read(taskRepoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: tasks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) => CheckboxListTile(
            title: Text(list[i].title),
            value: list[i].done,
            onChanged: (v) => repo.setDone(list[i], v ?? false),
            secondary: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => repo.remove(list[i]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => repo.add('New task'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
