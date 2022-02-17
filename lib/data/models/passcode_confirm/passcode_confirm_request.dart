class PasscodeConfirmRequest {
  String? passcode;
  String? passcodeToken;

  PasscodeConfirmRequest({this.passcode, this.passcodeToken});

  PasscodeConfirmRequest.fromJson(Map<String, dynamic> json) {
    passcode = json['passcode'];
    passcodeToken = json['passcode_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passcode'] = this.passcode;
    data['passcode_token'] = this.passcodeToken;
    return data;
  }
}
