import 'package:flutter/material.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
