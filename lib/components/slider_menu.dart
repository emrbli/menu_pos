import 'package:flutter/material.dart';
import 'package:menu_pos/data.dart';

Container SliderMenu(BuildContext context, var subMenus, int number) {
  return Container(
    height: MediaQuery.of(context).size.height / 4,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: getLenghtDeposit(subMenus),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4.1,
                  spreadRadius: 2.1,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Column(
              children: [
                Image.asset(DepositMap[subMenus[number]]['items'][index]['image']),
                SizedBox(
                  height: 21,
                ),
                Text(
                  DepositMap[subMenus[number]]['items'][index]['name'].toString() ,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
