import 'package:flutter/material.dart';
import 'package:flutter_app/ui/collect_list.dart';
import 'package:flutter_app/ui_ac/my_add_screen.dart';
import 'package:flutter_app/utils/route_util.dart';
import 'package:flutter_app/utils/toast_util.dart';
import 'package:flutter_app/utils/utils.dart';

//侧滑页面
class DrawerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DrawerScreenState();
  }
}

class DrawerScreenState extends State<DrawerScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 40, 16, 10),
              color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Image.asset(
                        Utils.getImgPath('ic_rank'),
                        color: Colors.white,
                        width: 20,
                        height: 20,
                      ),
                      onTap: () {
//                        RouteUtil.push(context, RankScreen());
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage(Utils.getImgPath('ic_default_avatar')),
                    radius: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('等级:',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[100]),
                          textAlign: TextAlign.center),
                      Text("2",
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[100]),
                          textAlign: TextAlign.center),
                      Text('排名:',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[100]),
                          textAlign: TextAlign.center),
                      Text("1",
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[100]),
                          textAlign: TextAlign.center),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("我的积分"),
              onTap: () {
                T.show(msg: "我的积分");
              },
              leading: Image.asset(
                Utils.getImgPath('ic_score'),
                width: 24,
                height: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text("我的收藏"),
              onTap: () {
                T.show(msg: "我的收藏");
                RouteUtil.push(context, MainHome2());
              },
              leading: Icon(Icons.favorite_border,
                  size: 24, color: Theme.of(context).primaryColor),
            ),
            ListTile(
              title: Text("我的分享"),
              onTap: () {
                T.show(msg: "我的分享");
                RouteUtil.push(context, MyAddScreen());
              },
              leading: Icon(Icons.share,
                  size: 24, color: Theme.of(context).primaryColor),
            ),
            ListTile(
              title: Text("系统设置"),
              onTap: () {
                T.show(msg: "系统设置");
              },
              leading: Icon(Icons.settings,
                  size: 24, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return true;
  }
}
