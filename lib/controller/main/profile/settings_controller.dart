import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class SettingsController extends BaseController {
  Future showModalBottomSheetFunction(BuildContext context) =>
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              height: 250,
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.0),
                  topRight: Radius.circular(13.0),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/ic_russia.svg"),
                    ),
                    title: const Text(
                      "Русский",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/ic_uzbekistan.svg"),
                    ),
                    title: const Text(
                      "O'zbekcha",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/ic_english.svg"),
                    ),
                    title: const Text(
                      "English",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          );
        },
      );

  Future showDialogFunction(BuildContext context) => showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text("Внимание!"),
          content: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Вы хотите выйти из профиля?"),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("Отмена"),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: const Text("Да"),
              onPressed: () {
                LocalSource.getInstance().removeProfile();
                Get.offAllNamed(Routes.main);
              },
            ),
          ],
        ),
      );
}
