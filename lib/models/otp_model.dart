class OtpModel {
  late int status;
  late String message;
  Account? account;

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
  }
}

class Account {
  int? id;
  String? name;
  String? phone;

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}
