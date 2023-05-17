
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Homepg.dart';
import 'colors.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({Key? key}) : super(key: key);

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  int pageIndex = 0;
  final Homepg homepg = Homepg();
  final ColorsA colorsA = ColorsA();

  Widget showPage = Homepg();

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return homepg;
        break;
      case 1:
        return colorsA;
        break;
      default:
        return Center(
          child: Text(
            "No page found by page chooser.",
            style: new TextStyle(fontSize: 30),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: showPage),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: [
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.color_lens_outlined, size: 30),
        ],
        color: Colors.grey.shade200,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.green,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            showPage = pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
