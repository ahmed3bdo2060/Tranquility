class PassValidator{
  static String? passWord(String? value){
    if(value!.isEmpty){
      return "you must enter your Password";
    }else if(value.length<3){
      return " you must enter at least 3 characters";
    }else{
      return "Invalid Password";
    }
  }
}