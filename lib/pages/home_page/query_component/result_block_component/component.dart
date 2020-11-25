import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/tax_code.dart';
import 'package:flutter_app/utils/app_theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ResultBlock extends Component<TaxCode> {
  ResultBlock()
      : super(
    view: buildView,
  );
}

Widget buildView(TaxCode state, dispatch, ViewService viewService){

  final List<String> labels = [
    "税收分类编码",
    "税收分类名称",
    "开票商品名称",
    "税率"
  ];

//  TextStyle t = TextStyle(
//      fontWeight: FontWeight.w400,
//      fontSize: 14,
//      color: AppTheme.nearlyBlack
//  );
  TextStyle t = AppTheme.body2;


  return SafeArea(
      child: SingleChildScrollView(
        child: Neumorphic(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          style: NeumorphicStyle(
            lightSource: LightSource.top,
            color: AppTheme.cardWhite,
            boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 67,
                padding: EdgeInsets.only(right: 11,bottom: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButtonHideUnderline(child: DropdownButton<String>(
                      onChanged: (String newValue) {print(newValue);},
                      items: <String>['保存', '清空']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: AppTheme.nearlyBlack,fontWeight: FontWeight.w300,fontSize: 16,),),
                        );
                      }).toList(),
                      icon: Icon(Icons.more_horiz, color: AppTheme.geoGreen,),
                      style: TextStyle(backgroundColor: Colors.white.withOpacity(0.5)),
                    ))

                  ],
                ),
              ),
              _TextField(label: labels[0], hint: state.typeCode),
              _TextField(label: labels[1], hint: state.typeName),
              _TextField(label: labels[2], hint: state.goodsName),
              _TextField(label: labels[3], hint: state.taxRate),
              Container(height: 33,)
            ],
          ),
        )
      )
  );
}

class _TextField extends StatefulWidget {
  final String label;
  final String hint;

  final ValueChanged<String> onChanged;

  _TextField({@required this.label, @required this.hint, this.onChanged});

  @override
  __TextFieldState createState() => __TextFieldState();
}

class __TextFieldState extends State<_TextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.hint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            this.widget.label,
            style: TextStyle(
              fontFamily: "cn1",
              fontWeight: FontWeight.w500,
              color: Colors.black45,
            ),
          ),
        ),
        Neumorphic(
          margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
          style: NeumorphicStyle(
            color: AppTheme.bgcNotWhite,
//            color: Color.fromRGBO(248,251,241,1),
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.stadium(),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: TextField(
            readOnly: true,
            onChanged: this.widget.onChanged,
            controller: _controller,
            decoration: InputDecoration.collapsed(hintText: this.widget.hint,hintStyle: TextStyle(color: AppTheme.nearlyBlack,fontSize: 15)),
          ),
        )
      ],
    );
  }
}
