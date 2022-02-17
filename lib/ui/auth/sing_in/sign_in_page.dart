import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sample_app_getx/controller/main/auth/sing_in_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:sample_app_getx/core/custom_widgets/text_fields/custom_phone_text_field.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class SignInPage extends GetView<SingInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String num = "+998";
    var localsource = LocalSource.getInstance();
    var maskFormatter = MaskTextInputFormatter(
      mask: ' ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Логин"),
      ),
      body: GetBuilder<SingInController>(
        // initState: (_) {},
        builder: (logic) {
          return ModalProgressHUD(
            inAsyncCall: logic.isLoading,
            child: Form(
              key: logic.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomPhoneTextField(
                      inputFormatters: [maskFormatter],
                      labelText: "Телефон номер",
                      prefixText: "+998",
                      keyboardType: TextInputType.number,
                      autoFocus: true,
                      required: true,
                      fillColor: const Color(0xffF9F9FD),
                      controller: controller.phoneController,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                      child: const Text("Логин"),
                      onTap: () async {
                        if (logic.formKey.currentState!.validate()) {
                          final result = await logic.postPhoneNumber(
                            (num + controller.phoneController.text)
                                .split(" ")
                                .join()
                                .toString(),
                          );
                          // localsource.setRefreshedTokens(accessToken: result);
                          if (result == null) {
                          } else if (result.isNotEmpty) {
                            Get.toNamed(Routes.sms, arguments: result);
                          } else {
                            Get.toNamed(Routes.auth);
                          }
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
