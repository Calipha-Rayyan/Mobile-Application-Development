class Animal {
  String? name;
  String? type;

  Animal(String name, String type) {
    this.name = name;
    this.type = type;
  }
  @override
  String toString() => '$name is a $type';
}

class Point {
  double x, y;
  Point(this.x, this.y);
  Point.origin() : x = 0, y = 0; // named constructor

  @override
  String toString() => 'X coord: $x, Y Coord: $y';
}
//******************User Class ************

class User {
  final String name;
  final bool isGuest;

  User(this.name) : isGuest = false;
  User.guest() : name = "Adam", isGuest = true;
  
  @override
  String toString() => isGuest ? '$name is a guest' : 'Not a guest';
}
//**************FromJson*****************************

class Product {
final String title;
final double price;

Product({required this.title, required this.price});

Product.fromJson(Map<String, dynamic> json) : title = json['title'], price = (json['price'] as num).toDouble(); 
@override
String toString() => 'Product $title has price $price'; 
}
//*********************Assertions*******************
class Circle {
  final double radius;
  final double area;
  Circle(this.radius)
      : area = 3.14159 * radius * radius,
        assert(radius > 0, 'radius must be positive');
@override
String toString() => 'Circle area: $area with radius: $radius';

}
//******************Rectangle Class*****************

class Rectangle {
  double _width, _height;
  Rectangle(this._width, this._height);
  double get area => _width * _height;
  set width(double w) { _width = w < 0 ? 0 : w; }
  
  @override
  String toString() => 'Rectange with $_width and $_height has area $area()';
}


//**********************Main Method******
void main() {
 // var animal = Animal('Rex', "Dog");
  //print(animal);

  //var p = Point.origin();
  //print("Point is: $p");

  //var u = User.guest();
  //print(u);
  
  //var v = Product.fromJson({'title':'Shoes', 'price':40});
  //print(v);
  
  var w = Circle(-1);
  print(w);
  
  //var x = Rectangle(2.3, 5.2);
  //print(x.area);
}
