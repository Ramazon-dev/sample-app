import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/profile/settings_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/ui/main/profile/widgets/profiel_details.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool cupertuniIcon = false;
    // var localSource = LocalSource.getInstance();
    return GetBuilder<SettingsController>(
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Settings"),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  logic.showDialogFunction(context);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileDetails(
                      ontap: () {
                        logic.showModalBottomSheetFunction(context);
                      },
                      leadingImg: "assets/svg/language.svg",
                      titel: "Язык",
                      trailing: SvgPicture.asset('assets/svg/ic_russia.svg'),
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/remove.svg",
                      titel: "Очистить кеш",
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/ring.svg",
                      titel: "Оповещения",
                      trailing: CupertinoSwitch(
                        value: cupertuniIcon,
                        onChanged: (v) {
                          cupertuniIcon = v;
                        },
                      ),
                    ),
                    ProfileDetails(
                      ontap: () {},
                      leadingImg: "assets/svg/voice.svg",
                      titel: "Звук",
                      trailing: CupertinoSwitch(
                        value: cupertuniIcon,
                        onChanged: (v) {
                          cupertuniIcon = v;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
