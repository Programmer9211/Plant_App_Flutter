import 'package:flutter/material.dart';
import 'package:plant_app/const.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: darkGreen,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 10,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          Positioned(
            top: 160,
            left: 10,
            child: Text(
              "Plant Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 10,
            child: Text(
              "Description of plant ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: 0,
            child: Container(
              height: size.height / 3,
              width: size.width / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    images[0],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 290,
            left: 20,
            child: moreImageOfPLant(size),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: container(size),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: navigator(size),
          ),
        ],
      ),
    );
  }

  Widget navigator(Size size) {
    return Container(
      height: size.height / 3,
      width: size.width / 10,
      child: Column(
        children: [
          navigatorItems(size, "Description", true),
          navigatorItems(size, "Reviews", false),
        ],
      ),
    );
  }

  Widget navigatorItems(Size size, String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: isSelected ? 5 : 0,
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.white : darkGreen,
        child: RotatedBox(
          quarterTurns: 3,
          child: Container(
            height: size.height / 10,
            width: size.width / 3.5,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? darkGreen : Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget container(Size size) {
    return Container(
      height: size.height / 2.5,
      width: size.width / 1.25,
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height / 30,
          ),
          Container(
            width: size.width / 1.45,
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.5,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Container(
            height: size.height / 12,
            width: size.width / 1.5,
            child: Row(
              children: [
                circleColor(size, color1),
                circleColor(size, color2),
                circleColor(size, color3),
                circleColor(size, color4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circleColor(Size size, Color color) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: size.height / 20,
        width: size.height / 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
    ;
  }

  Widget moreImageOfPLant(Size size) {
    return Container(
      height: size.height / 10,
      width: size.width / 1.6,
      child: Row(
        children: [
          items(size, images[0]),
          items(size, images[1]),
          items(size, images[2]),
        ],
      ),
    );
  }

  Widget items(Size size, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height / 14,
        width: size.height / 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
