import 'package:file_picker/file_picker.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/model/file_info.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<FileSelectorState> buildEffect() {
  return combineEffects(<Object, Effect<FileSelectorState>>{
    FileSelectorAction.action: _onAction,
    FileSelectorAction.pick: pick
  });
}

void _onAction(Action action, Context<FileSelectorState> ctx) {
}

Future<void> pick(Action action, Context<FileSelectorState> ctx) async {
  Toast.show("进入", ctx.context, gravity: Toast.CENTER);
  FilePickerStatus f(FilePickerStatus s) {
    return s;
  }
  FilePickerResult result = await FilePicker.platform.pickFiles(onFileLoading: f);


//  Toast.show(result.files.first.name, ctx.context,gravity: Toast.TOP);
  if(result != null) {
    PlatformFile file = result.files.first;

//                              print(file.name);
//                              print(file.bytes);
//                              print(file.size);
//                              print(file.extension);
//                              print(file.path);
//    Toast.show(file.path, ctx.context, gravity: Toast.TOP);
    int s = file.size*1.024.round();
    String size = s.toString()+"kb";
    FileInfo info = FileInfo(file.name, file.path, size);
    Toast.show(info.name, ctx.context, gravity: Toast.CENTER);
    ctx.dispatch(FileSelectorActionCreator.update(info));
  } else {
    // User canceled the picker
  }

}


