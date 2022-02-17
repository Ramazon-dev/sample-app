class PasscodeConfirmResponse {
  int? code;
  String? message;
  Null? error;
  Data? data;

  PasscodeConfirmResponse({this.code, this.message, this.error, this.data});

  PasscodeConfirmResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  ClientType? clientType;
  bool? userFound;
  User? user;
  Null? userSessions;
  Token? token;

  Data(
      {this.clientType,
      this.userFound,
      this.user,
      this.userSessions,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    clientType = json['client_type'] != null
        ? new ClientType.fromJson(json['client_type'])
        : null;
    userFound = json['user_found'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userSessions = json['user_sessions'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientType != null) {
      data['client_type'] = this.clientType!.toJson();
    }
    data['user_found'] = this.userFound;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_sessions'] = this.userSessions;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    return data;
  }
}

class ClientType {
  String? id;
  String? name;
  String? strategy;
  String? confirmBy;
  bool? phone;
  bool? email;
  bool? login;
  bool? selfRegister;
  bool? selfRecover;

  ClientType(
      {this.id,
      this.name,
      this.strategy,
      this.confirmBy,
      this.phone,
      this.email,
      this.login,
      this.selfRegister,
      this.selfRecover});

  ClientType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    strategy = json['strategy'];
    confirmBy = json['confirm_by'];
    phone = json['phone'];
    email = json['email'];
    login = json['login'];
    selfRegister = json['self_register'];
    selfRecover = json['self_recover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['strategy'] = this.strategy;
    data['confirm_by'] = this.confirmBy;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['login'] = this.login;
    data['self_register'] = this.selfRegister;
    data['self_recover'] = this.selfRecover;
    return data;
  }
}

class User {
  String? id;
  String? clientTypeId;
  String? roleId;
  String? password;
  int? active;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.clientTypeId,
      this.roleId,
      this.password,
      this.active,
      this.expiresAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientTypeId = json['client_type_id'];
    roleId = json['role_id'];
    password = json['password'];
    active = json['active'];
    expiresAt = json['expires_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_type_id'] = this.clientTypeId;
    data['role_id'] = this.roleId;
    data['password'] = this.password;
    data['active'] = this.active;
    data['expires_at'] = this.expiresAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Token {
  String? accessToken;
  String? refreshToken;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;
  int? refreshInSeconds;

  Token(
      {this.accessToken,
      this.refreshToken,
      this.createdAt,
      this.updatedAt,
      this.expiresAt,
      this.refreshInSeconds});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
    refreshInSeconds = json['refresh_in_seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['expires_at'] = this.expiresAt;
    data['refresh_in_seconds'] = this.refreshInSeconds;
    return data;
  }
}
