class UserMeRequest {
  String? authorization;
  String? platformId;

  UserMeRequest({this.authorization, this.platformId});

  UserMeRequest.fromJson(Map<String, dynamic> json) {
    authorization = json['Authorization'];
    platformId = json['platform-id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Authorization'] = this.authorization;
    data['platform-id'] = this.platformId;
    return data;
  }
}
