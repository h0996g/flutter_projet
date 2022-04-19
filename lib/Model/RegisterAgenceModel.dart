class RegisterAgenceModel {
  String? token;
  UserModel? user;
  AgenceModel? agence;
  RegisterAgenceModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = UserModel.fromJson(json['user']);
    agence = AgenceModel.fromJson(json['agence']);
  }
}

class UserModel {
  String? name;
  String? email;
  String? phone;
  int? id;

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
  }
}

class AgenceModel {
  String? address;
  int? user_id;
  int? id;

  AgenceModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    user_id = json['user_id'];
    id = json['id'];
  }
}
