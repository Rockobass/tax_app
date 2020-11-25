import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FileSelectorComponent extends Component<FileSelectorState> {
  FileSelectorComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FileSelectorState>(
                adapter: null,
                slots: <String, Dependent<FileSelectorState>>{
                }),);

}
