// // ===============================
// // AUTH REPOSITORY IMPLEMENTATION
// // ===============================
// //
// // This file implements the auth repository logic using FirebaseAuth.

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:to_do_list/features/authenticaiton/data/auth_repostry.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final FirebaseAuth _auth;

//   AuthRepositoryImpl(this._auth);

//   @override
//   Stream<User?> authStateChanges() {
//     return _auth.authStateChanges();
//   }

//   @override
//   Future<void> signOut() {
//     return _auth.signOut();
//   }

//   @override
//   Future<void> signUp({required String email, required String password}) {
//     return _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   @override
//   Future<void> signIn({required String email, required String password}) {
//     return _auth.signInWithEmailAndPassword(email: email, password: password);
//   }
// }
