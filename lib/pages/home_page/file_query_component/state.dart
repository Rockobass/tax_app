import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/model/file_info.dart';

class FileSelectorState implements Cloneable<FileSelectorState> {
  FileInfo info = FileInfo("", "", "");

  @override
  FileSelectorState clone() {
    return FileSelectorState()
      ..info = info
    ;
  }
}

FileSelectorState initState(Map<String, dynamic> args) {
  return FileSelectorState()
  ;
}
