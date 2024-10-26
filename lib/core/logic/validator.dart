class InputValidator{
    static final phoneNumberRegex = RegExp(r'^(9665[0-9]{11}|201[0-9]{9})$');
  static final passwordRegex = RegExp(r"((?=.*?[A-Z])|(?=.*?[a-z])|(?=.*?[0-9])|(?=.*?[!@#\$&*~])).{8,}");

  static String? phone(String? value ){
    if(value!.trim().isEmpty){
      return "phone must be not empty";
    }else if(!phoneNumberRegex.hasMatch(value)){
      return "invalid phone number";
    }
    return null;
  }
  static String? password(String? value ){
    if(value!.trim().isEmpty){
      return "phone must be not empty";
    }else if(!passwordRegex.hasMatch(value)){
      return"your passwor is weak";
    }
    return null;
  }

  static String? validatorNormalInput(String? value , String title){
    if(value!.trim().isEmpty){
      return "$title is empty";
    }else if(value.length<3){
      return "$title must be at least 3 character";
    }
    return null;
  }
  static String? myVal(String? value){
    if(value!.isEmpty){
      return  "is empty";
    }
    return null;
  }
}