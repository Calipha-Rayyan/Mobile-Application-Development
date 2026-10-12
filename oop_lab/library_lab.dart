// library_lab.dart  -  Campus Library System
// Name: Muhammad Rayyan Bhatti   Roll no: 04072312024

const String rollNo = '04072312024'; // e.g. '21F-0347'

// ===== Seeded settings (generated from YOUR roll number). Do not edit. =====
final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10; // tens digit
final int u = seed % 10; // units digit

const List<String> titles = [
  'Dart Basics',
  'Flutter In Action',
  'Data Structures',
  'Operating Systems',
  'Mobile Design',
  'Clean Code',
  'Algorithms Unlocked',
  'Computer Networks',
  'Database Systems',
  'Software Testing',
];

int yearOf(int i) => 1995 + 2 * i + t; // publication year of titles[i]
final int feePerDay = 5 + t; // late fee per day, in rupees
final int daysLate = 3 + (t + u) % 6; // normal number of days late
final int daysBig = 10 + u; // a long overdue period
final int feeCap = 150 + 10 * t; // no single fee may exceed this
final int renewLimit = 1 + t % 3; // renewals allowed per item
final int renewAttempts = 2 + u; // renewal attempts made in Step 5
final int shelfSize = 3 + u % 4; // items on the shelf in Steps 9-10
// ===========================================================================

// Parent class for all library items.
abstract class LibraryItem {
  final String title;
  final int year;

  LibraryItem(this.title, this.year);

  String describe() => '$title ($year)';

  // Every child class must implement this method.
  int lateFee(int days);
}

//Borrowable class
abstract class Borrowable {
  bool get isAvailable;

  void borrow();

  void giveBack();
}

mixin Renewable {
  int renewals = 0;

  bool renew(int limit) {
    if (renewals >= limit) {
      return false;
    }

    renewals++;
    return true;
  }
}

// Book class.
class Book extends LibraryItem with Renewable implements Borrowable {
  final int pages;
  bool _out = false;

  Book(super.title, super.year, this.pages);

  @override
  String describe() {
    return '${super.describe()}, $pages pages';
  }

  @override
  int lateFee(int days) {
    return days * feePerDay;
  }

  @override
  bool get isAvailable => !_out;

  @override
  void borrow() {
    _out = true;
  }

  @override
  void giveBack() {
    _out = false;
  }
}

// Magazine class.
class Magazine extends LibraryItem {
  final int issue;

  Magazine(super.title, super.year, this.issue);

  @override
  String describe() {
    return '${super.describe()}, issue $issue';
  }

  @override
  int lateFee(int days) {
    return days * (feePerDay ~/ 2);
  }
}

// DVD class.
class Dvd extends LibraryItem with Renewable {
  final int minutes;

  Dvd(super.title, super.year, this.minutes);

  @override
  String describe() {
    return '${super.describe()}, $minutes min';
  }

  @override
  int lateFee(int days) {
    return days * feePerDay * 2;
  }
}

// Helper functions.
Book mainBook() {
  return Book(titles[u], yearOf(u), 100 + 3 * seed);
}

Magazine mainMagazine() {
  final int i = (u + 1) % 10;

  return Magazine(titles[i], yearOf(i), 1 + (t + u) % 12);
}

Dvd mainDvd() {
  final int i = (u + 2) % 10;

  return Dvd(titles[i], yearOf(i), 90 + seed % 40);
}

enum MemberType {
  student(3, 50),
  faculty(10, 20),
  guest(1, 0);

  final int maxLoans;
  final int discountPercent;

  const MemberType(this.maxLoans, this.discountPercent);

  int applyDiscount(int fee) {
    return (fee * (100 - discountPercent)) ~/ 100;
  }
}

extension MoneyText on int {
  String get rs => 'Rs $this';
}

extension Initials on String {
  String get initials => split(' ').map((word) => word[0]).join();
}

extension ShelfMath on List<LibraryItem> {
  int totalLateFee(int days) {
    return fold(0, (sum, item) => sum + item.lateFee(days));
  }
}

// Fine Class
class Fine {
  final int amount;

  const Fine(this.amount);

  Fine operator +(Fine other) {
    return Fine(amount + other.amount);
  }

  bool operator >(Fine other) {
    return amount > other.amount;
  }

  @override
  bool operator ==(Object other) {
    return other is Fine && amount == other.amount;
  }

  @override
  int get hashCode => amount.hashCode;

  @override
  String toString() => 'Fine($amount)';
}

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

void step1() {
  print('--- Step 1 ---');

  final Book b = mainBook();
  final LibraryItem item = b;

  print('Step 1: ${b.title} (${b.year}), ${b.pages} pages');
  print('Step 1: stored as LibraryItem: ${item.title}');
  print('Step 1: runtimeType = ${item.runtimeType}');

  // Think: item.pages is a compile error because LibraryItem
  // does not declare a pages field.
}

void step2() {
  print('--- Step 2 ---');

  print('Step 2: ${mainBook().describe()}');
  print('Step 2: ${mainMagazine().describe()}');

  // Think: if describe() is misspelled as descibe(),
  // it will not override the parent's describe() method.
}

void step3() {
  print('--- Step 3 ---');

  print(
    'Step 3: Book late fee for $daysLate days = '
    '${mainBook().lateFee(daysLate)}',
  );

  print(
    'Step 3: Magazine late fee for $daysLate days = '
    '${mainMagazine().lateFee(daysLate)}',
  );

  print(
    'Step 3: Dvd late fee for $daysLate days = '
    '${mainDvd().lateFee(daysLate)}',
  );

  // Think: an abstract class cannot be instantiated directly
  // because it may contain methods without implementations.
}

void step4() {
  print('--- Step 4 ---');

  final Book book = mainBook();

  print('Step 4: available? ${book.isAvailable}');

  book.borrow();
  print('Step 4: after borrow? ${book.isAvailable}');

  book.giveBack();
  print('Step 4: after return? ${book.isAvailable}');

  final List<LibraryItem> items = [book, mainMagazine(), mainDvd()];

  for (final LibraryItem item in items) {
    print(
      'Step 4: ${item.runtimeType} borrowable? '
      '${item is Borrowable}',
    );
  }

  // Think: implements requires Book to provide the contract's
  // methods instead of inheriting their implementations.
}

void step5() {
  print('--- Step 5 ---');

  final Book book = mainBook();
  int ok = 0;

  for (int i = 0; i < renewAttempts; i++) {
    if (book.renew(renewLimit)) {
      ok++;
    }
  }

  print(
    'Step 5: renewed $ok of $renewAttempts attempts '
    '(limit $renewLimit)',
  );

  print('Step 5: renew once more? ${book.renew(renewLimit)}');
  print('Step 5: dvd can renew too? ${mainDvd().renew(1)}');

  // Think: the mixin shares renewal behavior with Books and DVDs.
  // Magazine does not need that behavior.
}

void step6() {
  print('--- Step 6 ---');

  final MemberType type = MemberType.values[seed % 3];
  final int fee = mainBook().lateFee(daysLate);

  print('Step 6: member type = ${type.name} (index ${type.index})');
  print('Step 6: max loans = ${type.maxLoans}');
  print(
    'Step 6: book fee $fee -> '
    '${type.applyDiscount(fee)} after discount',
  );

  // Think: enums prevent invalid member-type names.
}

void step7() {
  print('--- Step 7 ---');

  final MemberType type = MemberType.values[seed % 3];

  final int fee = type.applyDiscount(mainBook().lateFee(daysLate));

  final List<LibraryItem> shelf = [mainBook(), mainMagazine(), mainDvd()];

  print('Step 7: ${fee.rs}');
  print('Step 7: initials of "${titles[u]}" = ${titles[u].initials}');
  print(
    'Step 7: shelf fee for $daysLate days = '
    '${shelf.totalLateFee(daysLate).rs}',
  );

  // Think: extension methods add useful syntax to existing types.
}

void step8() {
  print('--- Step 8 ---');

  final Fine f1 = Fine(mainBook().lateFee(daysLate));
  final Fine f2 = Fine(mainMagazine().lateFee(daysLate));

  final Set<Fine> fines = {f1, Fine(f1.amount), f2};

  print('Step 8: $f1 + $f2 = ${f1 + f2}');
  print('Step 8: first bigger? ${f1 > f2}');
  print('Step 8: equal copies? ${f1 == Fine(f1.amount)}');
  print('Step 8: set size = ${fines.length}');

  // Think: hashCode must agree with == for sets and maps
  // to recognise equal values correctly.
}

void step9() {
  print('--- Step 9 ---');
}

void step10() {
  print('--- Step 10 ---');
}
