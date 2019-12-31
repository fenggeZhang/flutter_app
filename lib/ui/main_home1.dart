import 'package:flutter/material.dart';
import 'package:flutter_app/ui/main_home.dart';
import 'package:flutter_app/utils/route_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainHome2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainHome2();
  }
}

class _MainHome2 extends State<MainHome2> {
  List<String> _articles = new List();

  /// listview 控制器
  ScrollController _scrollController = new ScrollController();

  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    getTopArticleList();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("标题"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              RouteUtil.push(context, MainHome()); // 跳到搜索
            },
          )
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: getTopArticleList,
        onLoading: getMoreArticleList,
        controller: _refreshController,
        child: ListView.builder(
          itemBuilder: itemView,
          itemCount: _articles.length,
          controller: _scrollController,
        ),
      ),
    );
  }

  /// ListView 中每一行的视图
  Widget itemView(BuildContext context, int index) {
    String item = _articles[index];
    return Text("我是内容" + item.toString());
  }

  void getTopArticleList() {
    _articles.clear();
    _refreshController.refreshCompleted(resetFooterState: true);
    setState(() {
      _articles.add("文章头1");
      _articles.add("文章头2");
      _articles.add("文章头3");
    });
  }

  void getMoreArticleList() {
    _refreshController.loadComplete();
    setState(() {
      _articles.add("文章内容1");
      _articles.add("文章内容2");
      _articles.add("文章内容3");
    });
    //没有数据了
//    _refreshController.loadNoData();
    //数据加载失败
//    _refreshController.loadFailed();
  }
}
