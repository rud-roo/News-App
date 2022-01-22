import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  static const String path = "GridScreen";
  GridScreen({ Key? key }) : super(key: key);

  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.brown,
    Colors.pink,
    Colors.purple,
    Colors.green,
    Colors.grey,
    Colors.orange,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Grid Screen"),
      ),

      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: List.generate(10, (index) {
          return GridTile(
            header: Text("header"),
            child: FlutterLogo(),
            footer: Text("footer"),
          );
          // return Container(
          //   height: 100,
          //   width: 100,
          //   color: colors[index],
          //   child: FlutterLogo(),
          // );
        }),
        // children: [
        //   Container(
        //     height: 100,
        //     width: 100,
        //     color: Colors.red,
        //     child: FlutterLogo(),
        //   ),
        //   Container(
        //     height: 100,
        //     width: 100,
        //     color: Colors.red,
        //     child: FlutterLogo(),
        //   ),
        //   Container(
        //     height: 100,
        //     width: 100,
        //     color: Colors.red,
        //     child: FlutterLogo(),
        //   ),
        //   Container(
        //     height: 100,
        //     width: 100,
        //     color: Colors.red,
        //     child: FlutterLogo(),
        //   ),
        //   Container(
        //     height: 100,
        //     width: 100,
        //     color: Colors.red,
        //     child: FlutterLogo(),
        //   ),
        // ],
      ),
    );
  }
}