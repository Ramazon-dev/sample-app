class GenerateRequest {
  String? clientTypeId;
  String? password;
  String? username;
  Null? tag;

  GenerateRequest({this.clientTypeId, this.password, this.username, this.tag});

  GenerateRequest.fromJson(Map<String, dynamic> json) {
    clientTypeId = json['client_type_id'];
    password = json['password'];
    username = json['username'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_type_id'] = this.clientTypeId;
    data['password'] = this.password;
    data['username'] = this.username;
    data['tag'] = this.tag;
    return data;
  }
}
