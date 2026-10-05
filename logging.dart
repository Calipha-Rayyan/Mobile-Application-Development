class Logger {
  static Logger? _instance;
  int count = 0;
  Logger._internal() {
    // Private named cons
    print('>>> The only Logger created');
  }

  factory Logger() {
    return _instance ??= Logger._internal();
  }

  void log(String msg) {
    count++;
  }
}

void main() {
  var a = new Logger();
  a.log("Abc");
  a.log("xyz");
 var b = new Logger();
  print(b.count);
}
