import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New route" + text),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          FlatButton(
            child: Text("This is new route"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                print("结束当前页面!");
              }));
            },
          ),
        ],
      )),
    );
  }

  NewRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
}
