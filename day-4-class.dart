//OOP Concepts and Functions in Dart Programing 

//classes are you defining your own types and functions(Methods) 

//A class in terms of OOP is a blueprint for creating objects.

class FlutterStudent {
  //class memebers 
  String studentName;
  String bio;
  
  //it comes with an  implicit constructor 
  //What is a constructor: a constructor is a UNIQUE method that contructs the class variables
  
  //Explicit constructor (default )
  
//   FlutterStudent(this.studentName, this.bio) {
//     print("My data are : ${this.studentName}  ${this.bio}");
//   }
  
  
  //instances of this class are refer to as Objects (fluttertudent)
  
}






void main() {  
  
  
  creating an instance of a class 
  final taiwo = FlutterStudent();
  
  
  print(taiwo.studentName = "Joshua");
  
  
  
  

// List<String> myNames = ["Taiwo", "Joshua", "Adisa"];
  
//   //anonymous function in dart does not have a name 
//  myNames.forEach((name) => print("Your name is $name"));

   
}

//Functions are first class citizens

//Functions or Methods 

void sayHello ()=> print("Whats good");



void primeCheck(int num) {
  bool isNotPrime = false;
  for (int i = 2; i <= num / 2; ++i) {
// checking for prime or not prime
    if (num % i == 0) {
      isNotPrime = true;
      break;
    }
  }

  if (!isNotPrime) {
    print("Prime number.");
  } else {
    print("Not a prime number.");
  }
}

//optional and named parameter / argument
dynamic lessThan100({double num1, double num2 = 0}) {
  if ((num1 + num2) < 100) {
    return true;
  } else {
    return false;
  }
}

//lambda  or Fat Arrow 


bool lessThan102(double num1, [double num2 =0]) => (num1 + num2) <100 ? true : false;


 














