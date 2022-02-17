class RegistrResponse {
  int? code;
  String? message;
  Null? error;
  String? data;

  RegistrResponse({this.code, this.message, this.error, this.data});

  RegistrResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    error = json['error'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['error'] = this.error;
    data['data'] = this.data;
    return data;
  }
}
