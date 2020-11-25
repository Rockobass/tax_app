
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/model/file_info.dart';

//TODO replace with your own action
enum FileSelectorAction { action, update, pick }

class FileSelectorActionCreator {
  static Action onAction() {
    return const Action(FileSelectorAction.action);
  }

  static Action update(FileInfo file) {
    return Action(FileSelectorAction.update, payload: file);
  }

  static Action pick() {
    return Action(FileSelectorAction.pick);
  }
}
