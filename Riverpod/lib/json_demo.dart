import 'dart:convert';

const jsonText =
    '{"id": 1, "title": "sunt aut facere", "tags": ["a", "b"]}';

void main() {
  final map = jsonDecode(jsonText) as Map<String, dynamic>;

  print(map['title']); // sunt aut facere
  print(map['id'] + 1); // 2
  print(map['titel']); // null: this key is misspelled
  print(map['tags'][1]); // b
}
