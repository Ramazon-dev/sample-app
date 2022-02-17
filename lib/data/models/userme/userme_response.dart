class UserMeResponse {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phoneNumber;
  String? email;
  String? inn;
  String? dateOfBirth;
  String? profileImage;
  String? passportNumber;
  int? accountNumber;
  String? cityId;
  String? productId;
  String? adReference;

  UserMeResponse(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber,
      this.email,
      this.inn,
      this.dateOfBirth,
      this.profileImage,
      this.passportNumber,
      this.accountNumber,
      this.cityId,
      this.productId,
      this.adReference});

  UserMeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    inn = json['inn'];
    dateOfBirth = json['date_of_birth'];
    profileImage = json['profile_image'];
    passportNumber = json['passport_number'];
    accountNumber = json['account_number'];
    cityId = json['city_id'];
    productId = json['product_id'];
    adReference = json['ad_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['inn'] = this.inn;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_image'] = this.profileImage;
    data['passport_number'] = this.passportNumber;
    data['account_number'] = this.accountNumber;
    data['city_id'] = this.cityId;
    data['product_id'] = this.productId;
    data['ad_reference'] = this.adReference;
    return data;
  }
}
