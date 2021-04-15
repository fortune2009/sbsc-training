 
// Dart Conditional Statement 

//the if statement 

void main() {
  
  // bool:  false / true
  //declared and initialized 
  int age = 50;
  String name = "Taiwo";
  
  
  // Expected result:Say hello if the age is 30
  
  //if: An if statement will execute itws {BLOCK } as long as //the condition evaluates to TRUE 
  if (name == "") {
//     print("Hello your age is 30");
  }
  
  
  
  
  //if else: this program will say your age and welcome you if your age is not less than 50, else will tell you that you are tooooooooo young.
  
  if(age < 50) {
//     print("Hey, welcome");
  } else {
//       print("You're tooooooooo young");
  }
  
  
  // if else-if: if you want multiple conditions before executing any block of code, we use if else-if conditional statement 
  
  
  //buy her data 12gig, 10gig, 5gig, 2gig
  int gig = 0;
  
  
  if (gig == 12){
      print("Hey mom, you deserve this 12 gig of data");
  } else if(gig == 10){
      print("Hey mom, manage this for now");
  } else if(gig == 5){
      print("Hey mom, i hope this works ");
  } else if(gig == 2){
      print("Hey mom, pleaseeeeeeeeeeeeeeeeeeeeeeee");
  } else {
       print("Hey mom, God will provide");
  }
  
  
  // with all of the above conditional statements, do we still need another CONDITIONAL FLOW STATEMENT 
  
  
  
  
  
  
  
  
 switch(gig ) {
   case 15: print("heheheh");
     break;
   case 12: print("hhhaaaahhhaa");
     break;
   case 4: print("haaahaaa");
     break;
   default: print("Guy, u sef try do something");
     break;
 }
  
  
  
  
  
  
  
}
 
