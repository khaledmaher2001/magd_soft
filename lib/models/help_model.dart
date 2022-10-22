class HelpModel {
  late int status;
  late String? message;
  late List<Help> help;

  HelpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['help'] != null) {
      help = <Help>[];
      json['help'].forEach((v) {
        help.add(Help.fromJson(v));
      });
    }
  }
}

class Help {
  late int id;
  late String question;
  late String answer;

  Help.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}
