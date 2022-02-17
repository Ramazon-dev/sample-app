import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'banner_item.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final width = (Get.width - 16);
    final w = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.banners.isNotEmpty,
        child: Stack(
          children: [
            SizedBox(
              height: 180.0,
              width: w,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    height: 400.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }),
                itemCount: controller.banners.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = controller.banners[index];
                  return buildImage(urlImage, index);
                },
              ),
            ),
            Positioned(
              bottom: 20,
              right: w / 2,
              child: buildIndecator(controller),
            )
          ],
        ),
      ),
    );
  }

  buildImage(Banners urlImage, int index) => Positioned(
        child: Container(
          height: 185.0,
          margin: const EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width - 32.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(urlImage.image ?? ''),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );

  buildIndecator(HomeController controller) => AnimatedSmoothIndicator(
        effect: ScrollingDotsEffect(
            spacing: 2,
            dotColor: Colors.white.withOpacity(0.3),
            dotHeight: 5.0,
            dotWidth: 5.0,
            activeDotColor: Colors.black),
        activeIndex: activeIndex,
        count: controller.banners.length,
      );
}
