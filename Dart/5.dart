abstract class Apple 
{
  double getWeight();
}

class RedApple implements Apple 
{
  double weight;
  RedApple(this.weight);
  @override
  double getWeight() => weight;
}

class GreenApple implements Apple 
{
  double weight;
  GreenApple(this.weight);
  @override
  double getWeight() => weight;
}

void main() 
{
  var redApple = RedApple(0.2);
  var greenApple = GreenApple(0.15);
  print("Red Apple Weight: ${redApple.getWeight()} kg");
  print("Green Apple Weight: ${greenApple.getWeight()} kg");
}
