class LoginModel{
  late int status;
  late String message;
  String? code;

  LoginModel.fromJson(Map<String,dynamic>json){
   status=json['status'];
   message=json['message'];
   code=json['code'];
  }
}