import 'package:flutter/cupertino.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/floor/entity/products.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'basket_button.dart';

class BasketButtonWidget extends StatelessWidget {
  const BasketButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return StreamBuilder<List<Products>>(
      stream: LocalSource.getInstance().getAllBasketProducts(),
      builder: (_, snapshot) {
        var quantity = 0;
        var allPrice = 0.0;
        if (snapshot.hasData) {
          var ls = snapshot.data;
          quantity = ls!.length;
          // for (var element in ls) {
          //   allPrice += element.price * element.quantity;
          // }
        }
        return Visibility(
          visible: quantity > 0 && !controller.isLoading,
          child: BasketButton(
            // quantity: quantity,
            price: allPrice,
            onTap: () => Get.toNamed(Routes.basket),
          ),
        );
      },
    );
  }
}
