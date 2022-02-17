import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/models/auth/login_model.dart';
import 'package:sample_app_getx/data/models/code_generate/code_generate_request.dart';
import 'package:sample_app_getx/data/models/code_generate/code_generate_response.dart';
import 'package:sample_app_getx/data/repository/auth/auth_repository.dart';

class SingInController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final AuthRepository? authRepository;
  var formKey = GlobalKey<FormState>();
  String? token;
  SingInController({
    required this.authRepository,
    this.token,
  }) : assert(authRepository != null);
  List<AuthRequest> _username = [];
  LocalSource? localSource;
  TextEditingController phoneController = TextEditingController();
  // String? token2;

  Future<String?> postPhoneNumber(String username) async {
    setLoading(true);
    final result = await authRepository?.postPhoneNumber(
        username: AuthRequest(username: username));
    if (result is AuthResponse) {
      if (result.exists ?? false) {
        final String _result = await postPhoneNumber2(username);
        setLoading(false);

        return _result;
      } else {
        setLoading(false);

        return "";
      }
    } else {
      setLoading(false);

      Get.snackbar('error'.tr, result.toString());
      return null;
    }
  }

  Future<String> postPhoneNumber2(String phoneNumber) async {
    final result = await authRepository?.postPhoneNumber2(
        username: AuthRequest2(username: phoneNumber));
    if (result is AuthResponse) {
      if (result.exists ?? false) {
        final String _result = await passCodeGenerate(
            phoneNumber, "5a3818a9-90f0-44e9-a053-3be0ba1e2c07", "ahqCTxXquk3");

        ///Passcode generation
        return _result;
      } else {
        return "";
      }
    } else {
      Get.snackbar('error'.tr, result.toString());
      return "";
    }
  }

  ///Passcode func
  Future<String> passCodeGenerate(
      String phoneNumber, String clientTypeId, String tag) async {
    final result = await authRepository?.passCodeGenerate(
      username:
          GenerateRequest(username: phoneNumber, clientTypeId: clientTypeId),
    );
    if (result is GenerateResponse) {
      token = result.data?.passcodeToken ?? '';
      localSource?.setAccesToken(result.data?.passcodeToken);
      // print(
      //     'passcodeToken ${localSource?.setAccesToken(result.data?.passcodeToken)}');

      update();

      return result.data?.passcodeToken ?? "";
    } else {
      Get.snackbar('error'.tr, result.toString());
      return "";
    }
  }

  List<AuthRequest> get username => _username;
}
