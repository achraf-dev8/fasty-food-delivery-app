
String? validInput(String val, int min, int max, String type, var parentController, String? extraVarName){


  RegExp? regExp;
  if(val.isEmpty){
    return type != "Address" || type != "email" ? "Enter a $type" : "Enter an $type";
  }

  if(type == "First Name" || type == "Last Name"){

     regExp = RegExp(r"^[A-Za-z]+(([',. -][A-Za-z ])?[A-Za-z]*)*$");
  }else if(type == "Address"){

    regExp = RegExp(r"^[a-zA-Z0-9\s,.'-]*$");

  }else if(type == "Email"){


    regExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",);
   
    
  }else if(type == "Phone number"){

    regExp = RegExp(r'^\+\d{1,3}\d{10,14}$');

  }else if(type == "Email or phone number"){
       regExp = RegExp(
  r'^(?:\+?[1-9]\d{1,14}|[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$',
  caseSensitive: false,
);
  }else if(type == "Password"){
    const String wrongMsg= "Password must be at least 8 characters, include at least one letter and one number.";

   if (val.length < 8) {
    return wrongMsg;
  }
  
  final letterRegExp = RegExp(r'[a-zA-Z]');
  final numberRegExp = RegExp(r'\d');
  
  bool hasLetter = letterRegExp.hasMatch(val);
  bool hasNumber = numberRegExp.hasMatch(val);
  if(!hasLetter || !hasNumber){
    return wrongMsg;
  }}

  if(regExp != null){
    if(!regExp.hasMatch(val)){
      if(type == "Phone number"){
        return "Phone number must be of the same format as +213710656780";
      }else{
        return "$type is not valid";
      }
      
    }
    
  }

  if(val.length< min){
    return "$type is too short";
  }
    if(val.length> max){
    return "$type is too long";
  }
    if(parentController != null){
        return parentController.loginExists;  
    }
    
    return null;
}