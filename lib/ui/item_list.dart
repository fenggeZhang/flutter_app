import 'package:flutter/material.dart';

class ItemArticleList extends StatefulWidget {
  String item;

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
    return InkWell();
  }
}
