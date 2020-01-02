import 'package:flutter/material.dart';
import 'package:flutter_app/entity/article.dart';
import 'package:flutter_app/utils/route_util.dart';

class ItemArticleList extends StatefulWidget {
  Article item;

  ItemArticleList(this.item);

  @override
  State<StatefulWidget> createState() {
    return new ItemArticleListState();
  }
}

class ItemArticleListState extends State<ItemArticleList> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    //水波纹得效果
    return InkWell(
      onTap: () {
        RouteUtil.toWebView(context, item.title, "https://www.baidu.com");
      },
      child: Column(
        //列
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              //行
              children: <Widget>[
                Offstage(
                  offstage: item.isShow, //控件是否显示
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                        border:
                            new Border.all(color: Color(0xFFF44336), width: 1),
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(4, 4), //左上 右上
                            bottom: Radius.elliptical(4, 4))), //左下 右下
                    child: Text(
                      "置顶",
                      style: TextStyle(
                          fontSize: 16, color: const Color(0xFFF44336)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Offstage(
                  offstage: item.isShow, //控件是否显示
                  child: Container(
                    //可以设置 padding 和margin
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                    decoration: new BoxDecoration(
                        border:
                            new Border.all(color: Color(0xFFF44336), width: 1),
                        borderRadius: new BorderRadius.vertical(
                            top: Radius.elliptical(4, 4), //左上 右上
                            bottom: Radius.elliptical(4, 4))), //左下 右下
                    child: Text(
                      "新发布",
                      style: TextStyle(fontSize: 16, color: Colors.cyan),
                    ),
                  ),
                ),
                Text(
                  item.title,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                Expanded(
                  //此组件会填满Row在主轴方向的剩余空间，撑开Row
                  child: Text(
                    "12小时之前",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Offstage(
                  offstage: false,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      "http://big5.wallcoo.com/photograph/summer_feeling/images/%5Bwallcoo.com%5D_summer_feeling_234217.jpg",
                      width: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "高级UI成长之路 pathMeasure制作路径动画",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        "自定义控件/绘图相关",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
          Divider(height: 1)
        ],
      ),
    );
  }
}
