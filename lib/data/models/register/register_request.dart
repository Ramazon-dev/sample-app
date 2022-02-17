class RegistrRequest {
  String? clientTypeId;
  Null? email;
  Null? login;
  Null? password;
  String? phone;
  String? roleId;

  RegistrRequest(
      {this.clientTypeId,
      this.email,
      this.login,
      this.password,
      this.phone,
      this.roleId});

  RegistrRequest.fromJson(Map<String, dynamic> json) {
    clientTypeId = json['client_type_id'];
    email = json['email'];
    login = json['login'];
    password = json['password'];
    phone = json['phone'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_type_id'] = this.clientTypeId;
    data['email'] = this.email;
    data['login'] = this.login;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['role_id'] = this.roleId;
    return data;
  }
}
