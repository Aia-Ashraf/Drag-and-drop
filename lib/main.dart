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
            axis: Axis.vertical,
            affinity: Axis.vertical,
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              setState(() => position = offset);
            },
          ),
        ),
      ],
    );
  }
}

void onStarted() {
  print("Started");
}

void onCompleted() {
  print("Completed");
}
