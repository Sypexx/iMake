// import '../auth/auth_util.dart';
// import '../backend/backend.dart';
// import '../backend/firebase_storage/storage.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/upload_media.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class EditclientWidget extends StatefulWidget {
//   EditclientWidget({Key key}) : super(key: key);

//   @override
//   _EditclientWidgetState createState() => _EditclientWidgetState();
// }

// class _EditclientWidgetState extends State<EditclientWidget> {
//   String uploadedFileUrl = '';
//   TextEditingController textController;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     textController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<UsersRecord>(
//       stream: UsersRecord.getDocument(currentUserReference),
//       builder: (context, snapshot) {
//         // Customize what your widget looks like when it's loading.
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator());
//         }
//         final editclientUsersRecord = snapshot.data;
//         return Scaffold(
//           key: scaffoldKey,
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             automaticallyImplyLeading: false,
//             title: Text(
//               'Профиль',
//               style: FlutterFlowTheme.bodyText1.override(
//                 fontFamily: 'Playfair Display',
//                 fontSize: 24,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () async {
//                   Navigator.pop(context);
//                   final usersRecordData = createUsersRecordData(
//                     displayName: textController.text,
//                     photoUrl: uploadedFileUrl,
//                   );
//                   await editclientUsersRecord.reference.update(usersRecordData);
//                 },
//                 icon: Icon(
//                   Icons.check_circle,
//                   color: Colors.black,
//                   size: 30,
//                 ),
//                 iconSize: 30,
//               )
//             ],
//             centerTitle: true,
//             elevation: 4,
//           ),
//           body: SafeArea(
//             child: Align(
//               alignment: Alignment(0, 0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     child: InkWell(
//                       onTap: () async {
//                         final selectedMedia = await selectMedia();
//                         if (selectedMedia != null &&
//                             validateFileFormat(
//                                 selectedMedia.storagePath, context)) {
//                           showUploadMessage(context, 'Uploading file...',
//                               showLoading: true);
//                           final downloadUrl = await uploadData(
//                               selectedMedia.storagePath, selectedMedia.bytes);
//                           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                           if (downloadUrl != null) {
//                             setState(() => uploadedFileUrl = downloadUrl);
//                             showUploadMessage(context, 'Success!');
//                           } else {
//                             showUploadMessage(
//                                 context, 'Failed to upload media');
//                           }
//                         }
//                       },
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(50),
//                         child: Image.network(
//                           currentUserPhoto,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                     child: TextFormField(
//                       controller: textController,
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         hintText: editclientUsersRecord.displayName,
//                         hintStyle: FlutterFlowTheme.bodyText1.override(
//                           fontFamily: 'Playfair Display',
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 1,
//                           ),
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(4.0),
//                             topRight: Radius.circular(4.0),
//                           ),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0x00000000),
//                             width: 1,
//                           ),
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(4.0),
//                             topRight: Radius.circular(4.0),
//                           ),
//                         ),
//                       ),
//                       style: FlutterFlowTheme.bodyText1.override(
//                         fontFamily: 'Playfair Display',
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Почта',
//                           style: FlutterFlowTheme.bodyText1.override(
//                             fontFamily: 'Playfair Display',
//                           ),
//                         ),
//                         Text(
//                           currentUserEmail,
//                           style: FlutterFlowTheme.bodyText1.override(
//                             fontFamily: 'Playfair Display',
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                           child: Text(
//                             'Роль',
//                             style: FlutterFlowTheme.bodyText1.override(
//                               fontFamily: 'Playfair Display',
//                             ),
//                           ),
//                         ),
//                         Text(
//                           editclientUsersRecord.role,
//                           style: FlutterFlowTheme.bodyText1.override(
//                             fontFamily: 'Playfair Display',
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
