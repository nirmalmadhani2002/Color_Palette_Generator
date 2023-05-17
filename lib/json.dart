import 'dart:convert';
import 'package:flutter/services.dart' show Color, rootBundle;

class ColorBank {
  List<dynamic> colors = [];

  Future<void> loadColors() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    final jsonData = json.decode(jsonString);
    final colorList = jsonData['colors'];
    colors = colorList
        .map(
          (color) => Color(
              int.parse(color['hex'].substring(1, 7), radix: 16) + 0xFF000000),
        )
        .toList();
  }
}
