import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ui/collect_list.dart';
import 'package:flutter_app/ui_ac/drawer_screen.dart';
import 'package:flutter_app/ui_ac/my_add_screen.dart';
import 'package:flutter_app/utils/route_util.dart';
import 'package:flutter_app/utils/toast_util.dart';

//主页
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      /*routes: {
        "new_page":((context)=> NewRoute())
      },*/
      home: Main(title: 'Flutter应用主页'),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new MainScreenState();
  }
}

class MainScreenState extends State<Main> {
  int _selectedIndex = 1;

  PageController _pageController = PageController();

  /// 五个Tabs的内容
  var pages = <Widget>[
    MainHome2(),
    MainHome2(),
    MainHome2(),
    MainHome2(),
    MainHome2(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: DrawerScreen(), //抽屉 侧滑页面
        appBar: AppBar(
          title: new Text("Flutter应用主页"), //标题
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                T.show(msg: "搜索页");
              },
            )
          ],
        ),
        body: PageView.builder(
          itemBuilder: (context, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: buildImage(0, Icons.home), title: buildText("首页", 0)),
            BottomNavigationBarItem(
                icon: buildImage(1, Icons.camera), title: buildText("广场", 1)),
            BottomNavigationBarItem(
                icon: buildImage(
                  2,
                  Icons.chrome_reader_mode,
                ),
                title: buildText("栏目", 2)),
            BottomNavigationBarItem(
                icon: buildImage(3, Icons.border_all),
                title: buildText("分类", 3)),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildText(text, index) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey[600]),
    );
  }

  /// tabs 底总的图片
  Widget buildImage(index, iconPath) {
    return Icon(
      iconPath,
      size: 22,
      color: _selectedIndex == index
          ? Theme.of(context).primaryColor
          : Colors.grey[600],
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('提示'),
            content: new Text('确定退出应用吗？'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('再看一会', style: TextStyle(color: Colors.cyan)),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('退出', style: TextStyle(color: Colors.cyan)),
              ),
            ],
          ),
        ) ??
        false;
  }
}
