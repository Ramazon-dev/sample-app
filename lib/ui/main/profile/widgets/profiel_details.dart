import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';

class ProfileDetails extends StatelessWidget {
  final String leadingImg;
  final Function ontap;
  final String titel;
  Widget? trailing;
  ProfileDetails({
    Key? key,
    required this.leadingImg,
    required this.titel,
    required this.ontap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      child: ListTile(
        onTap: () => ontap(),
        leading: SvgPicture.asset(leadingImg),
        title: Text(titel, style: AppTextStyles.profileDetail),
        trailing:
            trailing ?? SvgPicture.asset("assets/svg/ic_profile_arrow.svg"),
      ),
    );
  }
}
