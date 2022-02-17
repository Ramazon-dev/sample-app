import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/ui/main/home/widgets/category_item.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, top: Get.width * 0.07),
                  child: const Text(
                    "Категории",
                    style: AppTextStyles.categoryTitle,
                  ),
                ),
                Flexible(
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    shrinkWrap: true,
                    addAutomaticKeepAlives: false,
                    cacheExtent: 200,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 12,
                    children: List.generate(
                      controller.categories.length,
                      (index2) => CategoryItem(
                        categorys: controller.categories[index2],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          childCount: 1,
        ),
      ),
    );
  }
}
