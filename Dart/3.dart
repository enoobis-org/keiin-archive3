abstract class Male 
{
  String name;

  Male(this.name);

  void sayName();
}

class Sigma extends Male 
{
  Sigma(String name) : super(name);

  void sayName() 
  {
    print('My name is $name, and I am a Sigma.');
  }
}

class Alpha extends Male 
{
  Alpha(String name) : super(name);

  void sayName() 
  {
    print('My name is $name, and I am an Alpha.');
  }
}

void main() 
{
  Sigma('Uran').sayName();
  Alpha('Akylbek').sayName();
}