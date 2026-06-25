//forst create a class
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._auth);

  //firebase auth variable; for firebase services
  final FirebaseAuth _auth;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  User? get currentUser {
    return _auth.currentUser;
  }

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

//now we havw to make providors for the class the user and
//the state change so we can access them in other parts of the application

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(FirebaseAuth.instance);
}

@riverpod
Stream<User?> authStateChanges(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}
@riverpod
User? currentUser(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUser;
}



// // ===============================
// // DATA LAYER
// // ===============================
// //
// // This file ONLY talks to Firebase.
// // No UI.
// // No Riverpod.
// // Just backend logic.

// import 'package:firebase_auth/firebase_auth.dart';

// class AuthRepository {
//   // FirebaseAuth is the real Firebase service
//   final FirebaseAuth _auth;

//   // Constructor: we pass FirebaseAuth into this class
//   AuthRepository(this._auth);

//   // ===============================
//   // SIGN IN FUNCTION
//   // ===============================
//   //
//   // Takes email + password
//   // Sends them to Firebase
//   Future<void> signIn({
//     required String email,
//     required String password,
//   }) {
//     return _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   // ===============================
//   // SIGN UP FUNCTION
//   // ===============================
//   Future<void> signUp({
//     required String email,
//     required String password,
//   }) {
//     return _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   // ===============================
//   // SIGN OUT FUNCTION
//   // ===============================
//   Future<void> signOut() {
//     return _auth.signOut();
//   }

//   // ===============================
//   // AUTH STATE STREAM
//   // ===============================
//   //
//   // This tells us:
//   // user logged in OR logged out
//   Stream<User?> authStateChanges() {
//     return _auth.authStateChanges();
//   }
// }
