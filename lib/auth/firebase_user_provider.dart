// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rxdart/rxdart.dart';

// class ImakeFirebaseUser {
//   ImakeFirebaseUser(this.user);
//   final User user;
//   bool get loggedIn => user != null;
// }

// ImakeFirebaseUser currentUser;
// bool get loggedIn => currentUser?.loggedIn ?? false;
// Stream<ImakeFirebaseUser> imakeFirebaseUserStream() => FirebaseAuth.instance
//     .authStateChanges()
//     .debounce((user) => user == null && !loggedIn
//         ? TimerStream(true, const Duration(seconds: 1))
//         : Stream.value(user))
//     .map<ImakeFirebaseUser>((user) => currentUser = ImakeFirebaseUser(user));
