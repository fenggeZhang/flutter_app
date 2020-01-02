import 'package:flutter/material.dart';
import 'package:flutter_app/entity/article.dart';
import 'package:flutter_app/ui/item_list.dart';
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
  List<Article> _articles = new List();

  /// listview 控制器
  ScrollController _scrollController = new ScrollController();

  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("文章列表"),
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
    Article item = _articles[index];
    return ItemArticleList(item);
  }

  void getTopArticleList() {
    _articles.clear();
    _refreshController.refreshCompleted(resetFooterState: true);
    setState(() {
      Article article = new Article();
      article.title = "自定义1";
      article.isShow = false;
      _articles.add(article);
      Article article1 = new Article();
      article1.title = "自定义2";
      article1.isShow = true;
      _articles.add(article1);
      _articles.add(article1);
      print("刷新");
    });
  }

  void getMoreArticleList() {
    _refreshController.loadComplete();
    setState(() {
      Article article = new Article();
      article.title = "高级1";
      article.isShow = false;
      _articles.add(article);
      Article article1 = new Article();
      article1.title = "高级2";
      article1.isShow = true;
      _articles.add(article1);
      _articles.add(article1);
      print("加载更多");
    });

    //没有数据了
//    _refreshController.loadNoData();
    //数据加载失败
//    _refreshController.loadFailed();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getTopArticleList();
    _scrollController.addListener(() {
      /// 滑动到底部，加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // getMoreArticleList();
      }
    });
  }
}
