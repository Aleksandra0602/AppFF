class LoginResponseModel {
  String? login;
  String? mail;
  String? eyes;
  String? photoBase;

  LoginResponseModel({this.login, this.mail, this.eyes, this.photoBase});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    mail = json['mail'];
    eyes = json['eyes'];
    photoBase = json['photo_base'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['mail'] = this.mail;
    data['eyes'] = this.eyes;
    data['photo_base'] = this.photoBase;
    return data;
  }
}