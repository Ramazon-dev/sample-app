import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/core/custom_widgets/bouncing/custom_bouncing_widget.dart';
import 'package:sample_app_getx/core/paints/icon_logo_painter.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/floor/entity/products.dart' as db;
import 'package:sample_app_getx/data/models/categories/category_response.dart';

class CategoryItem extends StatefulWidget {
  final Categories? categorys;
  final Function()? onTap;

  const CategoryItem({Key? key, this.categorys, this.onTap}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showPrice = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final width = (Get.width - 36) / 2;
    return CustomBouncingWidget(
      animationController: _controller,
      scaleFactor: 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: AppColors.white,
            ),
            height: (width * 1),
            child: StreamBuilder<List<db.Products>>(
              stream: LocalSource.getInstance().getAllBasketProducts(),
              builder: (context, snapshot) {
                var isBasket = false;
                db.Products? basketProducts;
                if (snapshot.hasData) {
                  for (var element in snapshot.data!) {
                    if (element.id == (widget.categorys?.id ?? '')) {
                      isBasket = true;
                      basketProducts = element;
                    }
                  }
                }
                var localSource = LocalSource.getInstance();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: width * 130 / 170,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Stack(
                        children: [
                          ///product image
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Hero(
                                tag: widget.categorys?.slug ?? '',
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.contain,
                                    errorWidget: (_, url, l) => const Center(
                                      child: CustomPaint(
                                        painter: IconLogoPainter(
                                          color: AppColors.black,
                                        ),
                                        size: Size(80, 80),
                                      ),
                                    ),
                                    placeholder: (_, e) => const Center(
                                      child: CupertinoActivityIndicator(),
                                    ),
                                    imageUrl: widget.categorys?.image ?? '',
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ///show hide animation widget
                          Positioned.fill(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: basketProducts != null && _showPrice
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: AppColors.black.withOpacity(0.4),
                                      ),
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [],
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () =>
                                    {} /*Get.toNamed(Routes.PRODUCT_DETAIL,
                                    arguments: widget.product)*/
                                ,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///product name
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.categorys?.name ?? '',
                            style: AppTextStyles.productTitle,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
