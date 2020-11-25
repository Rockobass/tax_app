import 'package:fish_redux/fish_redux.dart';
import 'adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class QueryPageComponent extends Component<QueryPageState> {
  QueryPageComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<QueryPageState>(
                adapter: NoneConn<QueryPageState>() + QueryAdapter(),
                slots: <String, Dependent<QueryPageState>>{
                }),);

}
