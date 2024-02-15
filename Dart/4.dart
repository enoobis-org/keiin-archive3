abstract class Fruit 
{
  void eat();
}

class Apple extends Fruit 
{
  var color;
  var weight;
  
  Apple(this.color, this.weight);

  @override
  void eat() 
  {
    print("You bite into the apple.");
  }
  
}
void main() 
{
  final apple = Apple("red" , 2.6);
  apple.eat();
}