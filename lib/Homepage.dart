import 'package:flutter/material.dart';
import 'package:plant_app/Secondpage.dart';
import 'package:plant_app/const.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController();

  List<NavigateItemsData> data = [
    NavigateItemsData(text: "Plant 1", isSelected: false),
    NavigateItemsData(text: "Plant 2", isSelected: true),
    NavigateItemsData(text: "Plant 3", isSelected: false),
    NavigateItemsData(text: "Plant 4", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: darkGreen,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: container(size),
          ),
          Positioned(
            top: 70,
            left: 30,
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: navigator(size),
          )
        ],
      ),
    );
  }

  Widget navigator(Size size) {
    return Container(
        height: size.height / 1.7,
        width: size.width / 8,
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return navigatorItems(
                  size, data[index].text, data[index].isSelected, index);
            }));
  }

  Widget navigatorItems(Size size, String text, bool isSelect, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: isSelect ? 5 : 0,
        color: isSelect ? Colors.white : darkGreen,
        borderRadius: BorderRadius.circular(10),
        child: RotatedBox(
          quarterTurns: 3,
          child: GestureDetector(
            onTap: () {
              _controller.animateToPage(index,
                  duration: Duration(milliseconds: 600), curve: Curves.ease);
            },
            child: Container(
              height: size.height / 15,
              width: size.width / 4.5,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    color: isSelect ? darkGreen : Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget container(Size size) {
    return Material(
      color: lightGreen,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
      ),
      child: Container(
        height: size.height / 1.1,
        width: size.width / 1.22,
        child: PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          onPageChanged: (val) {
            setState(() {
              data.forEach((element) {
                element.isSelected = false;
              });
              data[val].isSelected = true;
            });
          },
          children: [
            PageItems(),
            PageItems(),
            PageItems(),
            PageItems(),
          ],
        ),
      ),
    );
  }
}

class PageItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 1.1,
      width: size.width / 1.22,
      child: Column(
        children: [
          SizedBox(
            height: size.height / 25,
          ),
          Container(
            width: size.width / 1.4,
            child: Text(
              "Good Morning",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width / 1.4,
              child: Text(
                "Aditya Chaudhary",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width / 1.4,
              child: Text(
                "New Species",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          builder(size),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width / 1.4,
              child: Text(
                "Recently Views",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          recentViewBuilder(size),
        ],
      ),
    );
  }

  Widget recentViewBuilder(Size size) {
    return Container(
      height: size.height / 3,
      width: size.width / 1.3,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              height: size.height / 12,
              width: size.width / 1.3,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Container(
                      height: size.height / 14,
                      width: size.width / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 10,
                    child: Text(
                      "Plant Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    bottom: 10,
                    child: Text(
                      "Price: 86",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget builder(Size size) {
    return Container(
      height: size.height / 3.5,
      width: size.width / 1.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SecondScreen())),
              child: Container(
                height: size.height / 3.8,
                width: size.width / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      images[index],
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      bottom: 30,
                      child: Text(
                        "Plants Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 30,
                      child: Text(
                        "Price: 80",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NavigateItemsData {
  String text;
  bool isSelected;
  NavigateItemsData({this.isSelected, this.text});
}
