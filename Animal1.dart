class Animal {
  String? name;
  String? type;

  Animal(String name, String type) {
    this.name = name;
    this.type = type;
  }
  
  void speak() => print("...");
 
  @override
  String toString() => '$name is a $type';
}


class Dog extends Animal{
Dog(String name): super(name, 'Dog');

@override
void speak(){
super.speak();
print("Woof");}

}

//**********************Main Method******
void main() {
	var animal = Animal('Rex', "Dog");
	print(animal);
	animal.speak();
	var dog = Dog('Rilo');
	print(dog);
	dog.speak();
	Animal a = Dog('Max');
	print(a);
	//Dog c = Animal('Gypsy', 'Dog');
	//print(c);
}	
	

