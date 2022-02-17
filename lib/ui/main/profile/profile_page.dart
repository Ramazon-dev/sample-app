import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/profile/profile_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/ui/main/profile/widgets/profiel_details.dart';

import 'widgets/profile_appbar_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (logic) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileAppBar(),
              SizedBox(height: Get.width * 0.03),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  children: [
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/ic_change_profile.svg",
                      titel: "Изменить профиль",
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/ic_profile_order.svg",
                      titel: "История заказов",
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/ic_profile_history.svg",
                      titel: "История рассрочки",
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/ic_profile_calculate.svg",
                      titel: "Калькулятор рассрочки",
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/ic_profile_shopping.svg",
                      titel: "Магазины",
                    ),
                    ProfileDetails(
                      ontap: () {
                        Get.toNamed(Routes.settings);
                      },
                      leadingImg: "assets/svg/ic_profile_settings.svg",
                      titel: "Настройки",
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/ic_profile_contacts.svg",
                      titel: "Контакты",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
