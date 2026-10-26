void main(List<String> args) {
    List<String> names = ["Ali", 'Ahmad', 'Adam'];
    for (var name in names) helloDart(name);

  if (args.isEmpty) {
    print("Its empty");
  } else {
    print("The arg is: ${args[0]}");
  }
}

void helloDart(String name) {
  print("Hello, $name");
}
