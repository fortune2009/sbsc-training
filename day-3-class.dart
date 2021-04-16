 //Understanding Control flow statements in Dart and Data Types like List, Sets and Maps
 
 void main(){
   
   //! Don't Repeat Yourself (DRY)
   var myGs = ["Sandra","Hafis","Ayodele", "Chibuzor","David A","David F.","Simi Pam","AbdullaHIIIII"];
    
   
   //! For every data types, there are functions (in built methods) we can call for them.... get to know a few more 
   
   
   
  
   //Control FLow statement 
   
   
   //Hello to you 10x
   
   //for loop: (initialized; condition; incr/decr)
   for(int i = 1; i <= 10; i++){
//    print("Hello to you $i"); 
   }
   
   
   
   
   //for in loop: 
   for(String myCoolGs in myGs){
     if(myCoolGs.contains("Hafis")){
//        print("That guy, u need to be eating Eba wella");
     }
//      print("Hello to my gee $myCoolGs");
   }
   
   
   
   //while loop:
// i want to keep saving as long as the current value is less than 1000 Naira
   
   int currentBalance = 10;
   
   
   while(currentBalance< 1000){
//      print("Put $currentBalance  inside savings");
     
     //910
     currentBalance += 100;
//      1010
     
   }
   
   
   //do.. while() loop:
   do {
      print("Put $currentBalance  inside savings");
      currentBalance += 100;
   } while(currentBalance< 1000);
   
   
   //Dart Data Types 
   
   //Dart Lists:
   //Create a List 
   
   List<String> languages =  List(10); // this is fixed
   
//    List<String> languages2 =  List(); //this is not fixed, that means it can grow
   
   
   
   //i didn't point to the INDEX where i want to put this value
  List<int> lengthCount= List(3);
   
   languages[9]="Python";
   languages[8]="Java";
   languages[4]="C++";
   languages[1]="C#";
   languages[0]="Flutter"; 
   
   //
   
   for(int i =0; i <=  languages.length; i++){
      print( languages[i]  );
   }
   
   
   //Sets ,in dart: This is an unordered list and it always of unique elements 
   
   dynamic schools = <String>{"NIIT","Havard","MIT","Unisex University"};
   
   
   for(var school in schools){
     print(school);
   }
   
   schools.addAll(["Unicetf", "Uni gbas gbos"]);
  
   
   
   schools.add("Havard");
   
     print(schools);
   
   
   
   
   //Data Type : Map
   
   //Aside being a Google Map, its a collection of dynamic object 

   //It holds a key value pairs
   
   //set of identifier with their assigned value 
   
   //it is a collection type that holds a pair of dynamic objects
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
 }
