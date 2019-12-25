import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本、字体样式"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: 0.0, top: 16.0, right: 0.0, bottom: 0.0),
          ),
          FlatButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text("This is new route" + text),
            //设置圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NewRoute(text: "我得页面B传的值");
              }));
            },
          ),
          RaisedButton(
            elevation: 5,
            //这个默认有阴影
            textColor: Colors.white,
            color: Colors.blue,
            child: Text("This is new route" + text),
            //设置圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              print("按下");
            },
          ),

          new Image.asset('my_icons/all.png'),
          new Image(
            image: new AssetImage('my_icons/all.png'),
          ),
          //网络图片
          Image.network(
            "http://dmimg.5054399.com/allimg/pkm/pk/22.jpg",
            width: 100,
          ),
//          设置padding
          Padding(
            padding:
                EdgeInsets.only(left: 0.0, top: 16.0, right: 0.0, bottom: 0.0),
          ),
          Text(
            "hello text",
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Text(
            "hello world,my name is zfg." * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            "hello world",
            textScaleFactor: 1.5,
            style: TextStyle(
              //字间距宽度
              wordSpacing: 60,
              //字体颜色
              color: Colors.blue,
              fontSize: 18,
              //字体高度 因子 具体行高是height*fontsize
              height: 1.6,
              //背景颜色
              backgroundColor: Colors.yellow,
              //下划线
              decoration: TextDecoration.underline,
              //下划线样式
              decorationStyle: TextDecorationStyle.dashed,
            ),
          )
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
