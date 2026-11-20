// Freezed model. After saving, run in the terminal:
//   dart run build_runner build --delete-conflicting-outputs
// That creates task.freezed.dart and task.g.dart next to this file.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    @Default(false) bool done,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
