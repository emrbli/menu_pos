import 'package:flutter/material.dart';

Card buildCard(String productName, String productImage, String productPrice) {
  var cardImage = AssetImage(productImage);
  var name = productName;
  return Card(
      // elevation: 4.0,
      child: Column(
    children: [
      Container(
        height: 200.0,
        child: Ink.image(
          image: cardImage,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 21, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            productPrice == "0"
                ? Icon(Icons.arrow_forward_ios)
                : Text(productPrice.toString()+" ₺"),
          ],
        ),
      ),
    ],
  ));
}
