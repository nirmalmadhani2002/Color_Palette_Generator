import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import 'controllers/theme_provider.dart';

class Homepg extends StatefulWidget {
  @override
  _HomepgState createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  final TextEditingController _schemeNameController = TextEditingController();
  Color _currentColor = Colors.blue; // default color
  List<Color> _schemeColors = []; // empty color scheme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.light_mode),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .changeTheme();
            },
          ),
        ],
        title: Text('Pigments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _schemeColors.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: _schemeColors[index],
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _schemeNameController,
                    decoration: InputDecoration(hintText: 'Scheme name'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    _addColor();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    _saveScheme();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addColor() {
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
                setState(() {
                  _schemeColors.add(_currentColor);
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _saveScheme() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save scheme'),
          content: TextField(
            controller: _schemeNameController,
            decoration: InputDecoration(hintText: 'Scheme name'),
          ),
          actions: [
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('SAVE'),
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar('Scheme saved: ${_schemeNameController.text}');
                setState(() {
                  _schemeNameController.clear();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
