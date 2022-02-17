import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/ui/main/home/widgets/product_item.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);

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
                SizedBox(height: Get.width * 0.09),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'New',
                        style: AppTextStyles.categoryTitle,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 21.0),
                      child: SvgPicture.asset("assets/svg/ic_arrow_right.svg"),
                    ),
                  ],
                ),
                Flexible(
                  child: SizedBox(
                    height: Get.height * 0.26,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.products.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      shrinkWrap: true,
                      addAutomaticKeepAlives: false,
                      cacheExtent: 200,
                      itemBuilder: (contex, index2) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: ProductItem(
                            product: controller.products[index2],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          childCount: 2,
        ),
      ),
    );
  }
}
