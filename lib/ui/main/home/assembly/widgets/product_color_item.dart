import 'package:flutter/material.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';

class ProductColorItem extends StatefulWidget {
  const ProductColorItem({Key? key}) : super(key: key);

  @override
  State<ProductColorItem> createState() => _ProductColorItemState();
}

class _ProductColorItemState extends State<ProductColorItem> {
  int son = 0;

  List<Color> listOfColors = [
    AppColors.red,
    AppColors.black,
    Colors.yellow,
    AppColors.grey,
    AppColors.lightTestGrey,
    AppColors.assets,
  ];

  List<String> listOfStrings = [
    'Красный',
    'Черный',
    'Жёлтый',
    'Зеленый',
    'Белый',
    'Фиолетовый',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 276,
      color: Colors.transparent,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: listOfStrings.length,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              son = index;
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: listOfColors[index],
                    radius: 12,
                  ),
                  const SizedBox(height: 10),
                  Text(listOfStrings[index]),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: son == index ? Colors.blue : Colors.white,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        },
      ),
    );
  }
}
