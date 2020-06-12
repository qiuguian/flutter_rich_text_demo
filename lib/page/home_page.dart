import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rich_text_demo/util/util.dart';

import 'form_editor_page.dart';
import 'full_editor_screen_page.dart';
import 'view_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data = ['文本编辑器', '表单', '效果界面'];

  Widget rowView(index) {
    return new InkWell(
      child: new Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: new BoxDecoration(
            border: new Border(
                bottom: new BorderSide(width: 0.2, color: Colors.grey))),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text('${data[index]}'),
            new Icon(CupertinoIcons.right_chevron, color: Colors.grey),
          ],
        ),
      ),
      onTap: () => action(index),
    );
  }

  action(type) {
    switch (type) {
      case 0:
        routePush(new FullPageEditorScreen());
        break;
      case 1:
        routePush(new FormEmbeddedScreen());
        break;
      case 2:
        routePush(new ViewScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter rich text demo'),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: List.generate(data.length, (index) => rowView(index)),
        ),
      ),
    );
  }
}
