class ErrorRegisterModel {
  String? message;
  ErrorRegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
