class UserValidator{
  static String? userName(String? value){
    if(value!.isEmpty){
      return "you must enter your userName";
    }else if(value.length<3){
      return " you must enter at least 3 characters";
    }else{
      return "Invalid UserName";
    }
  }
}
