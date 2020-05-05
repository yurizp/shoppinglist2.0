import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list_20/exceptions/auth/disabled_user_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/inexistent_email_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_email_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_email_regex_execption.dart';
import 'package:shopping_list_20/exceptions/auth/invalid_password_firebase_execption.dart';
import 'package:shopping_list_20/exceptions/auth/password_dont_match_compare_execption.dart';
import 'package:shopping_list_20/exceptions/auth/too_many_requests_firebase_execption.dart';


class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> register(String email, String password, String confirmPassword) async {
    String errorMessage;
    bool isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    if(isValidEmail){
      throw new InvalidEmailRegexException("Invalid email appers to be invalid.");
    }

    if(password == confirmPassword){
      throw new PasswordDontMatchCompareException("Your password and confirm password is different.");
    }

    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          throw new InvalidEmailFirebaseException("Your email address appears to be malformed.");
        case "ERROR_WRONG_PASSWORD":
          throw new InvalidPasswordFirebaseException("Your password is wrong.");
        case "ERROR_USER_NOT_FOUND":
          throw new InexistentEmailFirebaseException("User with this email doesn't exist.");
        case "ERROR_USER_DISABLED":
          throw new DisabledUserFirebaseException("User with this email has been disabled.");
        case "ERROR_TOO_MANY_REQUESTS":
          throw new TooManyRequestsFirebaseException("Too many requests. Try again later.");
        case "ERROR_OPERATION_NOT_ALLOWED":
          throw new DisabledUserFirebaseException("Signing in with Email and Password is not enabled.");
        default:
          throw new InvalidEmailFirebaseException("Your email address appears to be malformed.");
      }
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
