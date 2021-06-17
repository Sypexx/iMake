import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddimgWidget extends StatefulWidget {
  AddimgWidget({Key key}) : super(key: key);

  @override
  _AddimgWidgetState createState() => _AddimgWidgetState();
}

class _AddimgWidgetState extends State<AddimgWidget> {
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Добавить работу',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pop(context);
              final imgUrl = uploadedFileUrl;
              final user = currentUserReference;
              final createdAt = getCurrentTimestamp;

              final postsRecordData = createPostsRecordData(
                imgUrl: imgUrl,
                user: user,
                createdAt: createdAt,
              );

              await PostsRecord.collection.doc().set(postsRecordData);
            },
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final selectedMedia = await selectMedia();
                      if (selectedMedia != null &&
                          validateFileFormat(
                              selectedMedia.storagePath, context)) {
                        showUploadMessage(context, 'Uploading file...',
                            showLoading: true);
                        final downloadUrl = await uploadData(
                            selectedMedia.storagePath, selectedMedia.bytes);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl = downloadUrl);
                          showUploadMessage(context, 'Success!');
                        } else {
                          showUploadMessage(context, 'Failed to upload media');
                        }
                      }
                    },
                    text: 'Загрузить работу',
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
