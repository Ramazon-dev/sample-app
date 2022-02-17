import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/assembly/assembly_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/ui/main/home/assembly/widgets/assembly_banner_widget.dart';
import 'package:sample_app_getx/ui/main/home/assembly/widgets/product_color_item.dart';
import 'package:sample_app_getx/ui/main/home/assembly/widgets/text_widget.dart';

import 'widgets/product_memory_item.dart';
import 'widgets/product_sim_item.dart';

class AssemblyPage extends GetView<AssemblyController> {
  const AssemblyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String slug = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: const Text("assembly"),
          actions: const [],
        ),
        body: GetBuilder<AssemblyController>(
          initState: ((state) {
            controller.getProductImage(id: slug);
            debugPrint('sssssssssssssssss slug: ${slug}');
          }),
          builder: (logic) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AssemblyBannerWidget(slug: slug),
                  const TextWidget(text: 'Выберите цвет'),
                  const ProductColorItem(),
                  const TextWidget(text: 'Выберите емкость памяти'),
                  const ProductMemoryItem(),
                  const TextWidget(text: 'Выберите конфигурацию'),
                  const ProductSimItem(),
                  const TextWidget(text: 'Характеристики'),
                  Container(
                    height: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(logic.price.toString()),
                  ),
                  // const ProductListWidget(),
                ],
              ),
            );
          },
        ),
        // bottomSheet: Container(),
        bottomNavigationBar: Container(
          height: 80,
          width: 375,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0.4,
                  blurRadius: 1.1,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: AppColors.white),
          child: CustomButton(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.add),
                    Text(''),
                  ],
                ),
                const Text('nrx'),
              ],
            ),
          ),
        ));
  }
}
