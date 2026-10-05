// lab3.dart - Campus Cafe Order System
// Name: Muhammad Rayyan Bhatti
// Roll no: 04072312024

const String rollNo = '04072312024';

// ===== Seeded settings (generated from roll number) =====
final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10;
final int u = seed % 10;

const List<String> menu = [
  'Chai',
  'Latte',
  'Mocha',
  'Samosa',
  'Brownie',
  'Sandwich',
  'Cold Coffee',
  'Fries',
  'Pakora',
  'Zinger Wrap',
];

int priceOf(int i) => 100 + 7 * i + 3 * t;

final int priceFloor = 60 + 5 * t;
final int taxPercent = 5 + t;
final int bigOrderLimit = 450 + 20 * t;
final int balanceCap = 600 + 20 * t;
final int couponPercent = 5 + t + u;

// ===========================================================================
// Step 1: Classes and Objects
// ===========================================================================

class Dish {
  late String name;
  late int price;
}

// ===========================================================================
// Step 2 and Step 3 and Step 8: MenuItem
// ===========================================================================

class MenuItem {
  String name;
  int price;

  // Constructor with this. shorthand.
  MenuItem(this.name, this.price) {
    // Keep price at least equal to priceFloor.
    if (this.price < priceFloor) {
      this.price = priceFloor;
    }
  }

  // Named constructor for free items.
  // It gives price = 0 directly.
  // The normal constructor body does not run here.
  MenuItem.free(this.name) : price = 0;

  // Named constructor that creates an item from text.
  // Example: "Chai:135"
  MenuItem.fromString(String text)
    : name = text.split(':')[0],
      price = int.parse(text.split(':')[1]);

  // Makes MenuItem print in a friendly way.
  @override
  String toString() => '$name (Rs $price)';
}

// ===========================================================================
// Step 4: Factory Constructor
// ===========================================================================

class OrderLog {
  static OrderLog? _instance;

  final List<String> entries = [];

  OrderLog._internal();

  // Factory constructor.
  // It always returns the same OrderLog object.
  factory OrderLog() {
    _instance ??= OrderLog._internal();
    return _instance!;
  }

  void add(String msg) => entries.add(msg);
}

// ===========================================================================
// Step 5 and Step 6: OrderLine
// ===========================================================================

class OrderLine {
  final MenuItem item;
  final int qty;
  final int total;
  final int tax;

  OrderLine(this.item, this.qty)
    : total = item.price * qty,
      tax = item.price * qty * taxPercent ~/ 100,
      assert(qty > 0, 'qty must be positive');

  // Getter for grand total.
  int get grand => total + tax;

  // Getter for checking big order.
  bool get isBigOrder => grand > bigOrderLimit;

  // Getter for a simple label.
  String get label => '${item.name} x$qty';
}

// ===========================================================================
// Step 5: Main Order
// ===========================================================================

OrderLine mainOrder() {
  return OrderLine(MenuItem(menu[u], priceOf(u)), 2 + (t + u) % 5);
}

// ===========================================================================
// Step 7: StudentCard
// ===========================================================================

class StudentCard {
  final String owner;
  int _balance;

  StudentCard(this.owner) : _balance = 0;

  int get balance => _balance;

  set balance(int value) {
    if (value < 0) {
      _balance = 0;
    } else if (value > balanceCap) {
      _balance = balanceCap;
    } else {
      _balance = value;
    }
  }
}

// ===========================================================================
// Step 8: Build Menu
// ===========================================================================

List<MenuItem> buildMenu() {
  return [
    for (int k = 0; k < 4; k++)
      MenuItem.fromString(
        '${menu[(u + 3 * k) % 10]}:${priceOf((u + 3 * k) % 10)}',
      ),
  ];
}

// ===========================================================================
// Step 9: Build Receipt
// ===========================================================================

List<OrderLine> buildReceipt() {
  final List<MenuItem> items = buildMenu();

  return [for (int k = 0; k < 3; k++) OrderLine(items[k], 1 + (t + k) % 4)];
}

// ===========================================================================
// Step 10: Coupon
// ===========================================================================

class Coupon {
  static final Map<String, Coupon> _cache = {};

  final String code;
  final int percent;
  final int minSpend;

  // Main constructor.
  Coupon(this.code, this.percent)
    : minSpend = percent * 70,
      assert(percent >= 1 && percent <= 50);

  // Factory constructor with cache.
  factory Coupon.fromCode(String code) {
    return _cache.putIfAbsent(code, () => Coupon(code, couponPercent));
  }

  // Calculates discount.
  int discountOn(int amount) {
    if (amount >= minSpend) {
      return amount * percent ~/ 100;
    }

    return 0;
  }
}

// ===========================================================================
// Step 1
// ===========================================================================

void step1() {
  print('--- Step 1 ---');

  Dish item1 = Dish();
  item1.name = menu[u];
  item1.price = priceOf(u);

  int secondIndex = (u + 1) % 10;

  Dish item2 = Dish();
  item2.name = menu[secondIndex];
  item2.price = priceOf(secondIndex);

  // Apply discount of u rupees.
  item2.price = item2.price - u;

  print('Step 1: ${item1.name} Rs ${item1.price}');
  print('Step 1: ${item2.name} Rs ${item2.price}');
}

// ===========================================================================
// Step 2
// ===========================================================================

void step2() {
  print('--- Step 2 ---');

  MenuItem a = MenuItem(menu[u], priceOf(u));
  MenuItem b = MenuItem('Test Special', 15 * u);

  print('Step 2: ${a.name} Rs ${a.price}');
  print('Step 2: Test Special Rs ${b.price}');

  // Think:
  // price cannot be final because the constructor body may change it
  // when it is below priceFloor.
}

// ===========================================================================
// Step 3
// ===========================================================================

void step3() {
  print('--- Step 3 ---');

  MenuItem freebie = MenuItem.free('Water');

  int selectedIndex = (u + 2) % 10;

  MenuItem parsed = MenuItem.fromString(
    '${menu[selectedIndex]}:${priceOf(selectedIndex)}',
  );

  print('Step 3: ${freebie.name} Rs ${freebie.price}');
  print('Step 3: ${parsed.name} Rs ${parsed.price}');
  print('Step 3: floor=$priceFloor, free price=${freebie.price}');

  // Think:
  // The free() constructor is a different constructor.
  // It directly sets price to 0, so the normal constructor body
  // containing the priceFloor check does not run.
}

// ===========================================================================
// Step 4
// ===========================================================================

void step4() {
  print('--- Step 4 ---');

  OrderLog log1 = OrderLog();
  OrderLog log2 = OrderLog();

  for (int i = 1; i <= u + 2; i++) {
    String message = 'order #${100 * t + i}';

    if (i % 2 == 1) {
      log1.add(message);
    } else {
      log2.add(message);
    }
  }

  print('Step 4: same object? ${identical(log1, log2)}');
  print('Step 4: entries = ${log1.entries.length}');
  print('Step 4: last = ${log2.entries.last}');

  // Think:
  // _instance and _internal start with an underscore because
  // underscore names are private in Dart.
  //
  // If they were public, other code could access the instance
  // or create it directly, which could break the singleton design.
}

// ===========================================================================
// Step 5
// ===========================================================================

void step5() {
  print('--- Step 5 ---');

  OrderLine line = mainOrder();

  print('Step 5: ${line.item.name} x${line.qty}');
  print('Step 5: total=${line.total} tax=${line.tax}');

  try {
    OrderLine(line.item, 0);
    print('Step 5: assert did NOT fire');
  } on AssertionError {
    print('Step 5: assert fired');
  }

  // Think:
  // An initializer list cannot read another field of the same object
  // because the object is still being initialized.
  // Use constructor parameters such as item and qty instead.
}

// ===========================================================================
// Step 6
// ===========================================================================

void step6() {
  print('--- Step 6 ---');

  OrderLine line = mainOrder();

  print('Step 6: grand=${line.grand}');
  print('Step 6: big order? ${line.isBigOrder} (limit $bigOrderLimit)');
  print('Step 6: label=${line.label}');

  // Think:
  // line.grand = 5 would fail because grand is a getter only.
  // To make it legal, we would need to add a setter for grand.
}

// ===========================================================================
// Step 7
// ===========================================================================

void step7() {
  print('--- Step 7 ---');

  StudentCard card = StudentCard('S$seed');

  card.balance = seed * 10 + 50;
  print('Step 7: topped up -> ${card.balance}');

  card.balance = -seed - 1;
  print('Step 7: bad value -> ${card.balance}');

  card.balance = balanceCap - u;
  print('Step 7: reset -> ${card.balance}');

  card.balance = card.balance - mainOrder().grand;
  print('Step 7: paid order -> ${card.balance}');

  // Think:
  // Instead of silently clamping an invalid value, a setter could
  // throw an exception or show an error message.
}

// ===========================================================================
// Step 8
// ===========================================================================

void step8() {
  print('--- Step 8 ---');

  List<MenuItem> items = buildMenu();

  MenuItem priciest = items.reduce(
    (first, second) => first.price > second.price ? first : second,
  );

  int sum = items.fold(0, (total, item) => total + item.price);

  print('Step 8: menu = $items');
  print('Step 8: priciest = ${priciest.name}');
  print('Step 8: sum = $sum');
}

// ===========================================================================
// Step 9
// ===========================================================================

void step9() {
  print('--- Step 9 ---');

  List<OrderLine> receipt = buildReceipt();
  OrderLog log = OrderLog();

  int receiptTotal = 0;

  for (OrderLine line in receipt) {
    print('Step 9: ${line.label} = ${line.grand}');

    log.add('receipt: ${line.label}');

    receiptTotal = receiptTotal + line.grand;
  }

  print('Step 9: receipt total = $receiptTotal');
  print('Step 9: log size = ${log.entries.length}');
}

// ===========================================================================
// Step 10
// ===========================================================================

void step10() {
  print('--- Step 10 ---');

  String code = 'CAFE${seed.toString().padLeft(2, '0')}';

  Coupon c1 = Coupon.fromCode(code);
  Coupon c2 = Coupon.fromCode(code);

  List<OrderLine> receiptLines = buildReceipt();

  int receipt = 0;

  for (OrderLine line in receiptLines) {
    receipt = receipt + line.grand;
  }

  int discount = c1.discountOn(receipt);

  print('Step 10: $code gives ${c1.percent}% off, min spend ${c1.minSpend}');
  print('Step 10: cached? ${identical(c1, c2)}');
  print(
    'Step 10: receipt $receipt, discount $discount, '
    'payable ${receipt - discount}',
  );
}

// ===========================================================================
// Main
// ===========================================================================

void main() {
  print('Seed: $seed (t=$t, u=$u)');

  step1();
  step2();
  step3();
  step4();
  step5();
  step6();
  step7();
  step8();
  step9();
  step10();
}

// ===========================================================================
// Wrap-up Questions
// ===========================================================================

// Q1:
// The this. shorthand saves us from writing separate assignments such as
// this.name = name and this.type = type. It makes the constructor shorter.

// Q2:
// We use a named constructor when we want another simple way to create
// an object. We use a factory constructor when we need control over which
// object is returned, such as returning a shared or cached object.

// Q3:
// An initializer list runs before the constructor body and is useful for
// initializing final fields. The constructor body runs after initialization
// and can perform additional logic.

// Q4:
// A getter is useful when a value is calculated from other data, such as
// grand. A setter is useful when we want to validate or control a value
// before storing it.
