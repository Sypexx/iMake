import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPageWidget extends StatefulWidget {
  AuthPageWidget({Key key}) : super(key: key);

  @override
  _AuthPageWidgetState createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  TextEditingController emailTextController;
  TextEditingController textController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    textController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF110631),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.01,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 1.74),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                          child: Image.asset(
                            'assets/images/image.PNG',
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: Container(
                            width: 285,
                            height: 40,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment(0, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(4, 0, 0, 1),
                                    child: TextFormField(
                                      controller: emailTextController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Почта',
                                        hintStyle: GoogleFonts.getFont(
                                          'Lato',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF3C2452),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF3C2452),
                                            width: 2,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Lato',
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.95, 0.5),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45, 0, 45, 30),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(29.31, 10.11),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(4, 0, 4, 3),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Роль',
                                      hintStyle: GoogleFonts.getFont(
                                        'Lato',
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF3C2452),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF3C2452),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.getFont(
                                      'Lato',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.94, 1.7),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCheckSquare,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: Container(
                            width: 285,
                            height: 40,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment(0, 0),
                                  child: TextFormField(
                                    controller: passwordTextController,
                                    obscureText: !passwordVisibility,
                                    decoration: InputDecoration(
                                      hintText: 'Пароль',
                                      hintStyle: GoogleFonts.getFont(
                                        'Lato',
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF3C2452),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF3C2452),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordVisibility =
                                              !passwordVisibility,
                                        ),
                                        child: Icon(
                                          passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.getFont(
                                      'Lato',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.95, 0.5),
                                  child: Icon(
                                    Icons.lock_open,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  final user = await createAccountWithEmail(
                                    context,
                                    emailTextController.text,
                                    passwordTextController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  final role = int.parse(textController.text);

                                  final usersRecordData = createUsersRecordData(
                                    role: role,
                                  );

                                  await UsersRecord.collection
                                      .doc(user.uid)
                                      .update(usersRecordData);

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavBarPage(
                                          initialPage: 'AccountPage'),
                                    ),
                                    (r) => false,
                                  );
                                },
                                text: 'Регистрация',
                                options: FFButtonOptions(
                                  width: 125,
                                  height: 40,
                                  color: Color(0x00FFFFFF),
                                  textStyle: GoogleFonts.getFont(
                                    'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF553BBA),
                                    width: 2,
                                  ),
                                  borderRadius: 0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final user = await signInWithEmail(
                                      context,
                                      emailTextController.text,
                                      passwordTextController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'AccountPage'),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: 'Авторизация',
                                  options: FFButtonOptions(
                                    width: 125,
                                    height: 40,
                                    color: Color(0x00FFFFFF),
                                    textStyle: GoogleFonts.getFont(
                                      'Lato',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    borderSide: BorderSide(
                                      color: Color(0xFF553BBA),
                                      width: 2,
                                    ),
                                    borderRadius: 0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'Забыли пароль?',
                          style: GoogleFonts.getFont(
                            'Lato',
                            color: Color(0xFF676767),
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
