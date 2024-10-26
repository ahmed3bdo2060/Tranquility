class LoginStates{}
class LoadingLoginState extends LoginStates{}
class SendLoginSuccessState extends LoginStates{}
class SendLoginFailedState extends LoginStates{
 final String msg;

  SendLoginFailedState({required this.msg});
}
