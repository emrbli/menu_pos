import 'package:flutter/material.dart';
import 'package:menu_pos/components/card.dart';
import 'package:menu_pos/data.dart';
import 'package:menu_pos/screens/inMenuPage.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 21,
            mainAxisSpacing: 20),
        itemCount: getLenght(IncomeMap['menus'][0]['items']),
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
              onTap: () {
                loadFile();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InMenuPage(
                      incomeData: IncomeMap['menus'][0]['items'][index]
                          ['items'],
                      title: IncomeMap['menus'][0]['items'][index]['name']
                          .toString(),
                    ),
                  ),
                );
                print(getLenght(IncomeMap['menus'][0]['items']));
              },
              child: buildCard(
                IncomeMap['menus'][0]['items'][index]['name'].toString(),
                IncomeMap['menus'][0]['items'][index]['image'],
                "0",
              ));
        });
  }
}
