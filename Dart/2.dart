class Person 
{
  String name;
  Person(this.name);
  void introduceYourself() {
    print('Hello, my name is $name.');
  }
}

abstract class Person2 
{
  String name;
  Person2(this.name);
  void introduceYourself();
}


class ChildPerson extends Person2 
{
  ChildPerson(String name) : super(name);
}

void main() {
  var person = Person('Daniel');
  person.introduceYourself();
  var person2 = ChildPerson('Akylbek');
  person2.introduceYourself();
}
