import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imake/grafik/grafik_widget.dart';
import 'package:imake/auth_page/auth_page_widget.dart';
import 'package:imake/widgets/time_select.dart';
import 'account_page/account_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'home_page/home_page_widget.dart';
import 'search_page/search_page_widget.dart';
import 'insta/insta_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: true, // 1
          systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Imake',
      //theme: ThemeData(primarySwatch: Colors.blue),
      // home: initialUser == null
      // ? Center(
      //     child: Builder(
      //       builder: (context) => Image.asset(
      //         'assets/images/image.PNG',
      //        width: MediaQuery.of(context).size.width / 2,
      //       fit: BoxFit.fitW0idth,
      //     ),
      //   ),
      // )
      //: currentUser.loggedIn
      //   ? NavBarPage()
      //    : AuthPageWidget(),
      home: AuthPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'SearchPage': SearchPageWidget(),
      'Insta': InstaWidget(),
      //'Messages': MessagesWidget(),
      'AccountPage': AccountPageWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color(0xFF9E9E9E),
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo,
              size: 24,
            ),
            label: 'PhotoPage',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.chat_bubble,
          //     size: 24,
          //   ),
          //   label: 'Chats',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              size: 24,
            ),
            label: 'Profile',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFF707070),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
