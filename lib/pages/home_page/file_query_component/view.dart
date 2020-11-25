import 'package:file_picker/file_picker.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/file_info.dart';
import 'package:flutter_app/utils/app_theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:toast/toast.dart';


import 'action.dart';
import 'appbar/appbar.dart';
import 'state.dart';

Widget buildView(FileSelectorState state, Dispatch dispatch, ViewService viewService) {

  return Container(
    child: Scaffold(
      backgroundColor: AppTheme.white,
      appBar: queryAppBar(),
      body: Container(
        child: Column(
          children: [
            Container(height: 40,),
Icon(Icons.cloud_upload, size: 250,color: AppTheme.nearlyDarkBlue.withOpacity(0.7),),
//            AspectRatio(aspectRatio: 1, child: Neumorphic(
//                margin: EdgeInsets.all(19),
//                style: NeumorphicStyle(
//                  shape: NeumorphicShape.convex,
//                  lightSource: LightSource.topLeft,
//                  depth: 20,
//                  color: AppTheme.bluePurple,
//                  boxShape: NeumorphicBoxShape.circle(),
//                ),
//                child: Neumorphic(
//                  style: NeumorphicStyle(
//                    lightSource: LightSource.bottom,
//                    color: AppTheme.nearlyDarkBlue.withOpacity(0.3),
//                    depth: -40,
//                    boxShape: NeumorphicBoxShape.circle(),
//                  ),
//                  margin: EdgeInsets.all(14),
//                  child: Neumorphic(
//                    style: NeumorphicStyle(
//                      depth: -8,
//                      boxShape: NeumorphicBoxShape.circle(),
//                    ),
//                    margin: EdgeInsets.all(18),
//                    child: Neumorphic(
//                      style: NeumorphicStyle(
//                          depth: -20,
//                        shadowDarkColor: AppTheme.geoGreen,
//                        shadowLightColor: AppTheme.geoGreen,
//                        shadowLightColorEmboss: AppTheme.nearlyDarkBlue,
//                        shadowDarkColorEmboss: AppTheme.nearlyDarkBlue
//                      ),
//                      child: InkWell(
//                        child: ClipOval(
//                          child: Image(image: AssetImage('assets/images/pack4.jpg')),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ),),
            Row(
              children: [
                SizedBox(width: 75,),
                Row(
                  children: [
                    Container(
                      height: 49,
                      width: 150,
                      child: NeumorphicButton(
                        minDistance: -3,
                        style: NeumorphicStyle(
                          color: AppTheme.nearlyDarkBlue.withOpacity(0.8),
                          shape: NeumorphicShape.convex,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(14))),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                            child: Text("上传文件",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700,fontFamily: '微软雅黑'))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          depth: 20,
                          intensity: 0.4,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(8)),
                        ),
                        child: NeumorphicButton(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.add,
                            color: AppTheme.white,
//                            color: Color(0xFFC1CDE5),
                          ),
                          onPressed: () {
                            print('选择文件');
                            dispatch(FileSelectorActionCreator.pick());
                            Toast.show('finish', viewService.context,gravity: Toast.BOTTOM);
//                            FilePickerResult result = await FilePicker.platform.pickFiles();
//
//                            if(result != null) {
//                              PlatformFile file = result.files.first;
//
////                              print(file.name);
////                              print(file.bytes);
////                              print(file.size);
////                              print(file.extension);
////                              print(file.path);
//                              int s = file.size*1.024.round();
//                              String size = s.toString()+"kb";
//                              FileInfo info = FileInfo(file.name, file.path, size);
//                              dispatch(FileSelectorActionCreator.update(info));
//                            } else {
//                              // User canceled the picker
//                            }
//                            try {
//                              _directoryPath = null;
//                              _paths = (await FilePicker.platform.pickFiles(
//                                type: _pickingType,
//                                allowMultiple: _multiPick,
//                                allowedExtensions: (_extension?.isNotEmpty ?? false)
//                                    ? _extension?.replaceAll(' ', '')?.split(',')
//                                    : null,
//                              ))
//                                  ?.files;
//                            } on PlatformException catch (e) {
//                              print("Unsupported operation" + e.toString());
//                            } catch (ex) {
//                              print(ex);
//                            }
//                            Fluttertoast.showToast(msg: _paths.first.name);
//                            if (_paths != null) {
//                              PlatformFile file = _paths.first;
//                              int s = file.size*1.024.round();
//                              String size = s.toString()+"kb";
//                              FileInfo info = FileInfo(file.name, file.path, size);
//                              dispatch(FileSelectorActionCreator.update(info));
//                            }
                          },
                          style: NeumorphicStyle(
                            color: AppTheme.nearlyDarkBlue.withOpacity(0.8),
                              depth: -1,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8))),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 60,)
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 21, top: 43),
              child: Column(
                children: [
                  LabelRow(label: "文件名",),
                  TextRow(text: state.info.name,),
                  LabelRow(label: "文件大小"),
                  TextRow(text: state.info.size, height: 17,),
                  LabelRow(label: "文件路径",),
                  TextRow(text: state.info.path, height: 80,)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class LabelRow extends StatefulWidget {
  final String label;

  const LabelRow({Key key, this.label}) : super(key: key);

  @override
  _LabelRowState createState() => _LabelRowState();
}

class _LabelRowState extends State<LabelRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      child: Align(
        child: Text(widget.label,style: TextStyle(
            fontSize: 17,fontWeight: FontWeight.w600,
          color: AppTheme.dark_grey,
          fontFamily: "Roboto"
        ),),
        alignment: Alignment.topLeft,
      ),
    );
  }
}


class TextRow extends StatefulWidget {
  final String text;
  final double height;

  const TextRow({Key key, this.text, this.height}) : super(key: key);
  @override
  _TextRowState createState() => _TextRowState();
}

class _TextRowState extends State<TextRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.only(bottom: 3),
      child: Align(
        child: Text(widget.text, overflow: TextOverflow.clip, style: TextStyle(color: AppTheme.nearlyBlack),),
        alignment: Alignment.topLeft,
      ),
    );
  }
}

//    child: RaisedButton(child: Text('文件上传'),onPressed: () async {
//      FilePickerResult result = await FilePicker.platform.pickFiles();
//
//    if(result != null) {
//      PlatformFile file = result.files.first;
//
//      print(file.name);
//      print(file.bytes);
//      print(file.size);
//      print(file.extension);
//      print(file.path);
//    } else {
//      // User canceled the picker
//    }},),


void _openFileExplorer() async {


}