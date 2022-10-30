import 'package:flutter/material.dart';

class DemoInheritedWidget extends StatefulWidget {
  const DemoInheritedWidget({Key? key}) : super(key: key);

  @override
  State<DemoInheritedWidget> createState() => _DemoInheritedWidgetState();
}

class _DemoInheritedWidgetState extends State<DemoInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Inherited Widget"),
      ),
      body: OngBa(
        child: Concai(
          child: Chac(),
        ),
      ),
    );
  }
}

class OngBa extends StatefulWidget {
  Widget child;

  OngBa({required this.child});

  @override
  _OngBaState createState() => _OngBaState();
}

class _OngBaState extends State<OngBa> {
  String text = "abc";

  void setText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Ong ba build");
    Map<String, dynamic> data = {"string": text, "function": setText};
    return Container(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Column(
          children: [
            Text(text),
            MyInheritedWidget(data: data, child: widget.child)
          ],
        ),
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  Map<String, dynamic> data;

  Widget child;

  MyInheritedWidget({required this.child, required this.data})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    //return oldWidget.data["string"] != data["string"];
    return false;
  }
}

class Concai extends StatelessWidget {
  Widget child;

  Concai({required this.child});

  @override
  Widget build(BuildContext context) {
    print("Con cai build");
    MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              inheritedWidget.data["function"]("Hello");
            },
            child: Text("Change text"),
          ),
          child
        ],
      ),
    );
  }
}

class Chac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Chac build");
    MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);
    return Container(
      child: Text(inheritedWidget.data["string"]),
    );
  }
}
