import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:menu_pos/components/card.dart';
import 'package:menu_pos/data.dart';
import 'package:menu_pos/screens/productDetailPage.dart';

class InMenuPage extends StatelessWidget {
  final incomeData;
  final title;
  const InMenuPage({Key? key, required this.incomeData, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 21,
                  mainAxisSpacing: 41),
              itemCount: getLenght(incomeData),
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                    onTap: () {
                      depositMap();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                                  name: incomeData[index]['name'].toString(),
                                  price: incomeData[index]['price'].toString(),
                                  image: incomeData[index]['image'],
                                  subMenus:
                                      incomeData[index]['subMenus'] != null
                                          ? incomeData[index]['subMenus']
                                          : null,
                                )),
                      );
                    },
                    child: buildCard(
                      incomeData[index]['name'].toString(),
                      incomeData[index]['image'],
                      incomeData[index]['price'].toString(),
                    ));
              },
            ),
          ),
        ));
  }
}
