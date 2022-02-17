import 'package:flutter/material.dart';

class ProductMemoryItem extends StatefulWidget {
  const ProductMemoryItem({Key? key}) : super(key: key);

  @override
  State<ProductMemoryItem> createState() => _ProductMemoryItemState();
}

class _ProductMemoryItemState extends State<ProductMemoryItem> {
  int sanoq = 0;

  List<String> listOfPrices = ['+150 000', '+300 000', '+600 000'];

  List<String> listOfMemory = ["64 GB", "128 GB", "256 GB"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      color: Colors.transparent,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: listOfMemory.length,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              setState(() {});
              sanoq = index;
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    listOfMemory[index],
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    listOfPrices[index],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: sanoq == index ? Colors.blue : Colors.white,
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
