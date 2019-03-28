import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drag app"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double width = 100.0, height = 100.0;
  Offset position;

  bool accepted = false;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: position.dx,
          top: position.dy - height + 20,
          child: Draggable(
            child: Container(
              width: width,
              height: height,
//              color: Colors.blue,
              child: Center(
                  child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/rice.jpg'),
                radius: 50,
              )),
            ),
            feedback: Container(
              child: Center(
                  child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/rice.jpg'),
              )),
//              color: Colors.blue[300],
              width: width,
              height: height,
            ),
            onDragStarted: onStarted,
            onDragCompleted: onCompleted,
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              setState(() => position = offset);
            },
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  width: 300.0,
                  height: 700.0,
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 50,
//                backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/rice.jpg'),
                      )))
              ,       Container(
                  width: 30.0,
                  height: 70.0,
                  margin:EdgeInsets.fromLTRB(2, 10, 10, 10) ,
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 50,
//                backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/rice.jpg'),
                      ))),
              Container(
                  width: 50.0,
                  height: 120.0,
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 50,
//                backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/rice.jpg'),
                      ))),
            ])
      ],
    );
  }
}

void onDone() {
  if (DraggableDetails == Axis.vertical) {
    print("onDone");
  }
}

void onStarted() {
  print("Started");
}

void onCompleted() {
  print("Completed");
}
