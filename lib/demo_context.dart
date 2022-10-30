import 'package:flutter/material.dart';

class DemoContext extends StatefulWidget {
  @override
  State<DemoContext> createState() => _DemoContextState();
}

class _DemoContextState extends State<DemoContext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo build context"),
      ),
      body: Container(
        child: Center(
          child: OngBa(),
        ),
      ),
    );
  }
}

class OngBa extends StatefulWidget {
  //
  String text = "Ông bà già";

  //C1 tìm thông qua Widget
  // static OngBa? of(BuildContext context) {
  //   return context.findAncestorWidgetOfExactType();
  // }

  //C2 tìm thông qua State<Object>
  static _OngBaState of(BuildContext context) {
    return context.findAncestorStateOfType()!;
  }

  @override
  State<OngBa> createState() => _OngBaState();
}

class _OngBaState extends State<OngBa> {
  // dữ liệu text2 nằm trong State<Object>
  String text2 = "Ông bà già 2 test";
  //
  @override
  Widget build(BuildContext context) {
    return ChaMe();
  }
}

class ChaMe extends StatelessWidget {
  //
  String textChaMe = "Cha mẹ 123";
  static ChaMe? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConTrai(),
        ConGai(),
      ],
    );
  }
}
// C1 lấy dữ liệu từ widget
// class ConTrai extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //
//     OngBa? ongBa = OngBa.of(context);

//     return Container(
//       child: Text(ongBa == null ? "" : ongBa.text2),
//     );
//   }
// }

//C2 lấy dữ liệu từ State<Object>
class ConTrai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    _OngBaState _ongBa = OngBa.of(context);

    return Container(
      child: Text(_ongBa.text2),
    );
  }
}

class ConGai extends StatefulWidget {
  @override
  State<ConGai> createState() => _ConGaiState();
}

class _ConGaiState extends State<ConGai> {
  @override
  Widget build(BuildContext context) {
    ChaMe? chaMe = ChaMe.of(context);
    return Container(
      child: Text(chaMe == null ? "" : chaMe.textChaMe),
    );
  }
}
