import 'package:etisalat_task/etisalat_task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Etisalat Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double itemWidth = 60.0;
  int itemCount = 100;
  int selected = 50;
  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListWheelScrollViewHorizontal.useDelegate(
        scrollDirection: Axis.horizontal,
        magnification: 2.0,
        onSelectedItemChanged: (x) {
          setState(() {
            selected = x;
          });
          print(selected);
        },
        controller: _scrollController,
        childDelegate: ListWheelChildBuilderDelegate(
            builder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: index == selected ? Colors.red : Colors.grey,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    width: MediaQuery.of(context).size.width * .3,
                    height: index == selected ? 100 : 80,
                    alignment: Alignment.center,
                    child: Text('$index')),
              ));
        }),
        itemExtent: MediaQuery.of(context).size.width * .3,
      )),
    );
  }
}
