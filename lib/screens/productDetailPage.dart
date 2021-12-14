import 'package:flutter/material.dart';
import 'package:menu_pos/components/slider_menu.dart';
import 'package:menu_pos/data.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final subMenus;

  const ProductDetailPage(
      {required this.name,
      required this.price,
      required this.image,
      required this.subMenus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Hero(
              tag: image,
              child: Image.asset(image),
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red[400],
                  size: 40.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 21.0,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              price + " ₺",
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 13),
              child: Text(
                "Bu bölümde ürün açıklaması bulunacak. Ürünün ne kadar içinde neler olduğu hakkında bilgiler verecek.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(
              height: 19.0,
            ),
            Column(
              children: [
                if (subMenus != null) ...[
                  Text(
                    "İndirimli Menuler",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[400],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2 + 100,
                    child: ListView.builder(
                        itemCount: getLenghtDeposit(subMenus),
                        itemBuilder: (BuildContext context, int index) {
                          return SliderMenu(context, subMenus, index);
                        }),
                  ),
                ] else if (subMenus == null) ...[
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 51.0,
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(13.0)),
                    child: Center(
                      child: Text(
                        "Sepete Ekle",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
          ],
        )
      ],
    ));
  }
}
