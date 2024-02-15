class MyClass 
{
  int secret = 0; 
  int get property => secret;

  set property(int value)
  {
    if (value >= 0) 
    {
      secret = value;
    }
  }
  
}

void main()
{
  var object1 = MyClass();
  object1.property = -20;
  var object2 = MyClass();
  object2.property = 42;
  
  print(object1.property); 
  print(object2.property); 
}