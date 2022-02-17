import 'package:flutter/material.dart';

class ProductSimItem extends StatefulWidget {
  const ProductSimItem({Key? key}) : super(key: key);

  @override
  _ProductSimItemState createState() => _ProductSimItemState();
}

class _ProductSimItemState extends State<ProductSimItem> {
  int sanoq = 0;

  List<String> listOfString = ['Одна сим-карта', 'Две сим-карты'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.transparent,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: listOfString.length,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              setState(() {});
              sanoq = index;
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                listOfString[index],
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
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
