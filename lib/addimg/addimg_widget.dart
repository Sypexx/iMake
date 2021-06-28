import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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
          'Загрузить выполненную работу',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Playfair Display',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pop(context);
              final createdAt = getCurrentTimestamp;

              final postsRecordData = createPostsRecordData(
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
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: () async {
                  final selectedMedia = await selectMedia();
                  if (selectedMedia != null &&
                      validateFileFormat(selectedMedia.storagePath, context)) {
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
                child: Image.network(
                  'https://picsum.photos/seed/121/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
