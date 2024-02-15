//agrigation 
class Engine {
  String capacity;

  Engine(this.capacity);
}

class Car {
  String make;
  String model;
  Engine engine;  // aggregation

  Car(this.make, this.model, this.engine);
}
//composition 


void main() 
{
  //agrigation 
  var engine1 = Engine("2.0L");
  var myCar = Car("Toyota", "Camry", engine1);

  // accessing the engines capacity
  print(myCar.engine.capacity);  // output: 2.0L
}