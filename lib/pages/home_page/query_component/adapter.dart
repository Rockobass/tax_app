import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/pages/home_page/query_component/query_row_component/component.dart';
import 'result_block_component/component.dart';
import 'state.dart';


class QueryAdapter extends SourceFlowAdapter<QueryPageState>{
  QueryAdapter(): super(
      pool: <String, Component<Object>>{
        "query_row": QueryRow(),
        "res_block": ResultBlock(),
      },
  );
}
