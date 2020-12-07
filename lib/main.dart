import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: dynamicPageView(),
      ),
    );
  }

  //#region Region - TabBar
  Widget tabBar() {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Text("CHATS"),
              Text("STATUS"),
              Text("CALL"),
            ],
            labelPadding: EdgeInsets.all(20),
            labelColor: Colors.blue,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: TabBarView(children: [
              Center(
                child: Text("Chats"),
              ),
              Center(
                child: Text("Status"),
              ),
              Center(
                child: Text("Call"),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  //#endregion

  //#region Region - Static PageView
  Widget staticPageView() {
    return Container(
        child: Stack(
      children: [
        PageView(
          onPageChanged: (position) {
            selectedPageIndex = position;
            setState(() {});
          },
          pageSnapping: true,
          children: <Widget>[
            Container(
              color: Colors.pink,
              child: Center(child: Text("Page 1")),
            ),
            Container(
              color: Colors.cyan,
              child: Center(child: Text("Page 2")),
            ),
            Container(
              color: Colors.deepPurple,
              child: Center(child: Text("Page 3")),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 100,
            height: 50,
            margin: EdgeInsets.only(bottom: 40),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.circle,
                    size: 12,
                    color: selectedPageIndex == 0 ? Colors.white : Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.circle,
                    size: 12,
                    color: selectedPageIndex == 1 ? Colors.white : Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.circle,
                    size: 12,
                    color: selectedPageIndex == 2 ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

//#endregion

  //#region Region - Dynamic PageView
  Widget dynamicPageView() {
    return Container(
        child: Stack(
      children: [
        PageView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Text("Page No ${index}"),
            );
          },
          itemCount: 5,
          onPageChanged: (position) {
            selectedPageIndex = position;
            setState(() {});
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.circle,
                    size: 12,
                    color: selectedPageIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              },
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        )
      ],
    ));
  }
//#endregion
}
