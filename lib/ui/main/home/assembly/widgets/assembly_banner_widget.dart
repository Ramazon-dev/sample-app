import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/assembly/assembly_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AssemblyBannerWidget extends StatefulWidget {
  String slug;
  AssemblyBannerWidget({Key? key, required this.slug}) : super(key: key);

  @override
  State<AssemblyBannerWidget> createState() => _AssemblyBannerWidgetState();
}

class _AssemblyBannerWidgetState extends State<AssemblyBannerWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final width = (Get.width - 16);
    final w = MediaQuery.of(context).size.width;
    return GetBuilder<AssemblyController>(
      builder: (controller) => Visibility(
        visible: controller.result.isNotEmpty,
        child: Stack(
          children: [
            SizedBox(
              height: 180.0,
              width: w,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    // autoPlay: true,
                    viewportFraction: 1,
                    height: 400.0,
                    onPageChanged: (index, reason) {
                      setState(() {
// print("hhhhhhhhhhhhhhhhhh ${controller.result[0].toString()}");
                        activeIndex = index;
                      });
                    }),
                itemCount: controller.result.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = controller.result[index];
                  return assemblybuildImage(urlImage, index);
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

  buildIndecator(AssemblyController controller) => AnimatedSmoothIndicator(
        effect: ScrollingDotsEffect(
            spacing: 2,
            dotColor: Colors.white.withOpacity(0.3),
            dotHeight: 5.0,
            dotWidth: 5.0,
            activeDotColor: Colors.black),
        activeIndex: activeIndex,
        count: controller.result.length,
      );
  assemblybuildImage(String urlImage, int index) => Positioned(
        child: Container(
          height: 185.0,
          margin: const EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width - 32.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(urlImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
}
