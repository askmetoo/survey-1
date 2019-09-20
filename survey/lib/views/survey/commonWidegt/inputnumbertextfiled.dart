import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensoro_survey/views/survey/const.dart' as prefix0;

class inputnumbertextfiled extends StatefulWidget {
  final String title;
  final int intputtype;
  final callbacktext;
  final onChanged;
  TextEditingController _editingController = TextEditingController();

  inputnumbertextfiled(
      {Key key, this.title, this.intputtype, this.callbacktext, this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _inputnumbertextfiledState();
  }
}

class _inputnumbertextfiledState extends State<inputnumbertextfiled> {
  @override
  void initState() {
    super.initState();
    widget._editingController.addListener(() {
      widget.callbacktext(widget._editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: new EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              widget.title,
              style: new TextStyle(fontSize: prefix0.fontsSize),
            ),
            Expanded(
              child: TextField(
                controller: widget._editingController,
                onChanged: (v) {
                  widget.onChanged(v);
                },

                keyboardType: widget.intputtype == 1
                    ? TextInputType.number
                    : TextInputType.text,

                inputFormatters: widget.intputtype == 1
                    ? [WhitelistingTextInputFormatter.digitsOnly]
                    : null,
                //只允许输入数字
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '请输入',
                ),
                autofocus: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}