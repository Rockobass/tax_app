import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawer_starter/utils/drawer_model.dart';
import 'package:flutter_app/pages/home_page/query_component/query_row_component/state.dart';
import 'package:flutter_app/utils/app_theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../action.dart';

class QueryRow extends Component<QueryRowState> {
  QueryRow()
      : super(
            view: buildView,
 );
}

Widget buildView(QueryRowState state, dispatch, ViewService viewService){
  TextEditingController query = state.query;
  query.text = state.searchText;
  query.selection = TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: state.searchText.length));
  return Container(
    width: MediaQuery.of(viewService.context).size.width,
      padding: EdgeInsets.only(right: 11),
      child: Column(
        children: [
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 278,
                child: Neumorphic(
                  margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                  style: NeumorphicStyle(
                    color: AppTheme.notWhite,
                    depth: NeumorphicTheme.embossDepth(viewService.context),
                    boxShape: NeumorphicBoxShape.stadium(),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  child: TextField(
                    controller: query,
                    cursorColor: AppTheme.geoGreen,
                    decoration: InputDecoration.collapsed(hintText: "请输入商品名称"),
                  ),
                ),
              ),
              NeumorphicButton(
                padding: EdgeInsets.fromLTRB(11, 10, 8, 9),
                minDistance: -5.0,
                style: NeumorphicStyle(
                  color: AppTheme.geoGreen,
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  dispatch(QueryPageActionCreator.onQuery(query.text));
                },
              ),
            ],
          ),
        ],
      )
  );
}

