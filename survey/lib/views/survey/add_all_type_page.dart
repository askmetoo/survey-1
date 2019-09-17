/// @Author: zyg
/// @Date: 2019-09-12
/// @Last Modified by: zyg
/// @Last Modified time: 2019-09-12
/// 适配各种类型的增加新勘察数据的主页面
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';
import 'package:sensoro_survey/widgets/text_input.dart';
import 'package:sensoro_survey/model/component_configure_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:sensoro_survey/widgets/component.dart';
import 'package:sensoro_survey/views/survey/const.dart' as prefix0;
import 'package:sensoro_survey/views/survey/const.dart';
import 'package:sensoro_survey/views/survey/item_widget.dart';

class AddAllPage1 extends StatefulWidget {
  List<dynamic> input;
  AddAllPage1({Key key, @required this.input}) : super(key: key);

  @override
  _AddAllPageState1 createState() => _AddAllPageState1(input: this.input);
}

class _AddAllPageState1 extends State<AddAllPage1> {
  List<dynamic> input;
  _AddAllPageState1({this.input});

  bool isCheck = false;
  List<dynamic> dataList = [];

  //组件即将销毁时调用
  @override
  void dispose() {
//    dataList.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // componentModel model = componentModel("", "", "", "", {});

    // model.variable_name = "输入文本";
    // model.type = "textInput";
    // dataList.add(model);

    // model = componentModel("", "", "", "", {});
    // model.variable_name = "大输入框";
    // model.type = "textView";
    // dataList.add(model);

    // model = componentModel("", "", "", "", {});
    // model.variable_name = "弹出选择菜单";
    // model.type = "popList";
    // dataList.add(model);

    // model = componentModel("", "", "", "", {});
    // model.variable_name = "日期选择器";
    // model.type = "datePicker";
    // dataList.add(model);

    // model = componentModel("", "", "", "", {});
    // model.variable_name = "添加图片";
    // model.type = "image";
    // dataList.add(model);

    // model = componentModel("", "", "", "", {});
    // model.variable_name = "跳转地图";
    // model.type = "map";
    // dataList.add(model);

    // model = componentModel("", "", "", "", {});
    // model.variable_name = "单选圆按钮";
    // model.type = "ratio";
    // dataList.add(model);

    // model = componentModel("", "", "", "", {});
    // model.variable_name = "复选框";
    // model.type = "checkBox";
    // dataList.add(model);

    if (ComponentConfig.confiureList.length > 0) {
      dataList = ComponentConfig.confiureList;
    }

    // initDetailList();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        //or set color with: Color(0xFF0000FF)
        // statusBarColor: Colors.blue,
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget emptyContainer = Container(
      height: 0,
      width: 0,
    );

    Widget indexContainer = Container(
      height: 0,
      width: 0,
    );

    Widget bottomButton = Container(
      color: prefix0.LIGHT_LINE_COLOR,
      height: 60,
      width: prefix0.screen_width,
      child: new MaterialButton(
        color: isCheck == true ? prefix0.GREEN_COLOR : Colors.grey,
        textColor: Colors.white,
        child: new Text("完成",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20)),
        onPressed: () {
          // getBookName;
          // if (this.name.length > 0) {
          // saveInfoInLocal();
          // Navigator.of(context).pop("refreshList");
          // }
        },
      ),
    );

    Widget navBar = AppBar(
      elevation: 1.0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "勘察点信息",
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        icon: Image.asset(
          "assets/images/back.png",
          // height: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    Widget step1 = Container(
        color: prefix0.LIGHT_LINE_COLOR,
        child: new Column(
          children: <Widget>[
            new Row(children: <Widget>[
              Padding(
                child: new Text(
                  "电刑",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                padding: new EdgeInsets.fromLTRB(20, 20, 20, 20),
              )
            ]),
            // container,
          ],
        ));

    Widget myListView = new ListView.builder(
        physics: new AlwaysScrollableScrollPhysics()
            .applyTo(new BouncingScrollPhysics()), // 这个是用来控制能否在不满屏的状态下滚动的属性
        itemCount: dataList.length == 0 ? 1 : dataList.length,
        // separatorBuilder: (BuildContext context, int index) =>
        // Divider(height: 1.0, color: Colors.grey, indent: 20), // 添加分割线
        itemBuilder: (BuildContext context, int index) {
          componentModel model;
          if (dataList[index] is Map) {
            Map json = dataList[index] as Map;
            model = componentModel.fromJson(json);
          }

          // print("rebuild index =$index");
          if (dataList.length == 0) {
            return new Container(
              padding: const EdgeInsets.only(
                  top: 150.0, bottom: 0, left: 0, right: 0),
              child: new Column(children: <Widget>[
                new Image(
                  image: new AssetImage("assets/images/nocontent.png"),
                  width: 120,
                  height: 120,
                  // fit: BoxFit.fitWidth,
                ),
                Text("没有已创建的",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: prefix0.LIGHT_TEXT_COLOR,
                        fontWeight: FontWeight.normal,
                        fontSize: 17)),
              ]),
            );
          }

          return new Container(
            padding:
                const EdgeInsets.only(top: 0.0, bottom: 0, left: 20, right: 20),
            child: new Column(children: <Widget>[
              GestureDetector(
                //zyg onTap带参数事件
                onTap: () {
                  // addAttribute(index);
                },

                child: itemClass(model: model),
              ),

              //分割线
              Container(
                  width: prefix0.screen_width - 40,
                  height: 1.0,
                  color: FENGE_LINE_COLOR),
            ]),
          );
        });

    return Scaffold(
        appBar: navBar,
        body: myListView,
        bottomNavigationBar: BottomAppBar(
          child: bottomButton,
        )
        // bottomSheet: bottomButton,
        );
    // TODO: implement build
    return null;
  }
}

// class AddAllPage1 extends StatefulWidget {
//   componentModel input;
//   AddAllPage1({Key key, @required this.input}) : super(key: key);

//   @override
//   _AddAllPageState1 createState() => _AddAllPageState1(input: this.input);
// }

// class _AddAllPageState1 extends State<AddAllPage1> {
//   componentModel input;
//   _AddAllPageState1({this.input});
