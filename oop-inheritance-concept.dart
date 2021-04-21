//Deep dive into Dart OOP Concepts (Inheritance, super constructor, method overriding )
//
class ParentClass {
  //class memebrs can be fields/ variables, methods/functions, setters and getters, constructors (explicit or implicit and also have  named constructor )
  //
  String myParent;
  double myParentHeight;
  
  //class members 
  int age;
//   setters and getters : are special methods of a class 
  void set setAge(int age) => this.age = age;
  
  //getter 
  int get getAge{
    return this.age;
  }

  
  // Explicit contructor 
  ParentClass(String parentName, double parentHeight) {
    this.myParent = parentName;
    this.myParentHeight = parentHeight;

    introduce(this.myParent, this.myParentHeight);
  }

  
  //custom method
  void introduce(String name, double height) {
    print("Parent class data : $name.......$height");
  }
}

class Child1Class extends ParentClass {
  String look;

  ChildClass(String look, String myParent, double myParentHeight) : super(myParent, myParentHeight) 
    {
    this.look = look;

    print(this.look);
  }
  
  
  
  //this is method overriding and the core take out is: the signature must be the same as long as the method is not marked final from the super class
  void introduce(String name, double height ){
    
    print("From child class, this is all about me: ${this.look}");
  }
  
}

void main() {
  final parentClass = ParentClass("Adisa", 6.9);
  parentClass.setAge = 70;
  int age = parentClass.getAge;
  print(age);
  
  
  
  
//   ChildClass childClass = Child1Class("5.5","Adisa Ade", 12.9);
  
//   childClass.introduce("Adams O.", 15.0); 
}















