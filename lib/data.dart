import "package:flutter/services.dart" as s;
import 'package:menu_pos/components/menu_grid.dart';
import 'package:yaml/yaml.dart';

Map IncomeMap = {};
Map DepositMap = {};
loadFile() async {
  final data = await s.rootBundle.loadString('assets/yaml/menu.yaml');
  IncomeMap = loadYaml(data);
  return MenuGrid();
}

getLenght(var data) {
  List<String> items = [];
  data.forEach((s) => items.add(s["name"]));

  return items.length;
}

depositMap() {
  IncomeMap['menus'].forEach((s) => DepositMap[s["key"]] = s);
}

getLenghtDeposit(var data) {
  List<String> items = [];
  data.forEach((s) => items.add(s));

  return items.length;
}
