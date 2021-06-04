import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;


//untuk mendaftarkan user dengan email dan password
Future<User> createUserWithEmail(email, password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
  }

//untuk login user dengan email dan password
Future<User> signInEmail(String email, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);

    final User currentUser = await auth.currentUser;
    assert(user.uid == currentUser.uid);
    print('signInEmail succeeded: $user');
    return user;
  }

  
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    print("User Signed Out");
  }
}
