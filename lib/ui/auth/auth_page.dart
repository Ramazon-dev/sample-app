import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sample_app_getx/controller/main/auth/auth_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/custom_widgets/text_fields/custom_phone_text_field.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class RegistrationPage extends GetView<AuthController> {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maskFormatter = MaskTextInputFormatter(
      mask: ' ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Регистрация"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomPhoneTextField(
              labelText: "Имя",
              required: true,
              fillColor: Colors.grey.withOpacity(0.03),
              controller: controller.nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomPhoneTextField(
              labelText: "Фамилия",
              required: true,
              fillColor: Colors.grey.withOpacity(0.03),
              controller: controller.surNameCotroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomPhoneTextField(
              labelText: "Телефон номер",
              required: true,
              prefixText: "+998",
              inputFormatters: [maskFormatter],
              keyboardType: TextInputType.number,
              fillColor: Colors.grey.withOpacity(0.03),
              controller: controller.registerPhoneController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomPhoneTextField(
              labelText: "Пароль",
              required: true,
              obscureText: true,
              fillColor: Colors.grey.withOpacity(0.03),
              controller: controller.registerPasswordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomPhoneTextField(
              labelText: "Подтверждение пароля",
              required: true,
              obscureText: true,
              fillColor: Colors.grey.withOpacity(0.03),
              controller: controller.registerPasswordCheckController,
            ),
          ),
          const Spacer(),
          CustomButton(
            margin: const EdgeInsets.all(16.0),
            child: const Text("Регистрация"),
            onTap: () {
              Get.toNamed(Routes.sms);
            },
          ),
        ],
      ),
    );
  }
}
