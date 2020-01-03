import 'package:flutter/material.dart';
import 'package:flutter_app/ui/main_test1.dart';
import 'package:flutter_app/utils/route_util.dart';
import 'package:flutter_app/utils/toast_util.dart';

class MyAddScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAddScreenState();
  }
}

class _MyAddScreenState extends State<MyAddScreen>
    with SingleTickerProviderStateMixin {
  /// tabs的名字
  final bottomBarTitles = ["已发布", "未发布"];
  final iconDatas = [Icons.account_balance_wallet, Icons.border_color];
  int currentIndex = 0;
  List tabs = ["新闻", "历史", "图片"];
  TabController _tabController; //需要定义一个Controller
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("我的分享"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              RouteUtil.push(context, MainHome()); // 跳到搜索
            },
          )
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList()),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: () {
            T.show(msg: "发布");
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*  body: pages[currentIndex],*/
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            SizedBox(height: 49, width: 49, child: bottomAppBarItem(0)),
            SizedBox(height: 49, width: 49),
            SizedBox(height: 49, width: 49, child: bottomAppBarItem(1)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }

  Widget bottomAppBarItem(int index) {
    //设置默认未选中的状态
    TextStyle style = TextStyle(fontSize: 12, color: Colors.black);
    Color color = Colors.grey[600];
    if (currentIndex == index) {
      //选中的话
      style = TextStyle(fontSize: 13, color: Colors.blue);
      color = Colors.blue;
    }
    //构造返回的Widget
    Widget item = Container(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              iconDatas[index],
              color: color,
            ),
            Text(
              bottomBarTitles[index],
              style: style,
            )
          ],
        ),
        onTap: () {
          if (currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
    return item;
  }
}
