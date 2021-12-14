import 'dart:io';

import 'package:flutter/material.dart';
import 'package:menu_pos/components/menu_grid.dart';
import 'package:menu_pos/data.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    loadFile().then((value) {
      print('Async done');
      setState(() {
        MenuGrid();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SambaPos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(11),
        child: MenuGrid(),
      ),
    );
  }
}
