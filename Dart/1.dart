class Person 
{
  String? name;
  int age = 0;

  void display() {
    print('Name: $name');
    print('Age: $age');
  }
}

abstract class Person2 
{
  String? name;
  int age = 0;

  void display();
}

class ConcretePerson extends Person2 
{
  @override
  void display() {
    print('Name: $name');
    print('Age: $age');
  }
}


void main()
{
  var person = Person();
  person.name = 'John';
  person.age = 30;
  person.display();
}