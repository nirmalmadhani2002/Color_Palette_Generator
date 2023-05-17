import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorsA extends StatefulWidget {
  @override
  _ColorsAState createState() => _ColorsAState();
}

class _ColorsAState extends State<ColorsA> {
  Color _currentColor = Colors.blue; // default color
  List<Color> _palette = []; // empty palette

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Palette Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            ElevatedButton(
              child: Text('Choose a color'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Choose a color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (Color color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                          pickerAreaHeightPercent: 0.8,
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            generatePalette();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Text('Current color:'),
            SizedBox(height: 10),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: _currentColor,
                border: Border.all(width: 2, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Text('Generated palette:'),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: _palette.map((color) {
                  return Container(
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void generatePalette() {
    setState(() {
      _palette.clear();
      _palette.add(_currentColor);
      _palette.add(_currentColor.withAlpha(50));
      _palette.add(_currentColor.withAlpha(100));
      _palette.add(_currentColor.withAlpha(200));
      _palette.add(_currentColor.withAlpha(250));
      _palette.add(_currentColor.withAlpha(300));
      _palette.add(_currentColor.withAlpha(350));
      _palette.add(_currentColor.withAlpha(400));
      _palette.add(_currentColor.withAlpha(450));
      _palette.add(_currentColor.withBlue(450));
      _palette.add(_currentColor.withGreen(500));
      _palette.add(_currentColor.withRed(255));
    });
  }
}
