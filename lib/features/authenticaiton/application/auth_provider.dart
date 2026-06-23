// // ===============================
// // APPLICATION LAYER (Riverpod)
// // ===============================
// //
// // This file CONNECTS Riverpod + Repository

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:to_do_list/features/authenticaiton/data/auth_repostry.dart';


// // ===============================
// // PROVIDE FIREBASE AUTH
// // ===============================
// //
// // This gives FirebaseAuth.instance everywhere
// final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
//   return FirebaseAuth.instance;
// });


// // ===============================
// // PROVIDE REPOSITORY
// // ===============================
// //
// // This connects FirebaseAuth → AuthRepository
// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   final firebaseAuth = ref.watch(firebaseAuthProvider);
//   return AuthRepository(firebaseAuth);
// });


// // ===============================
// // AUTH STATE STREAM PROVIDER
// // ===============================
// //
// // This listens to login/logout changes
// //
// // Example:
// // user logs in → updates automatically
// final authStateProvider = StreamProvider<User?>((ref) {
//   final repo = ref.watch(authRepositoryProvider);
//   return repo.authStateChanges();
// });

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // This placeholder will fix the "undefined name" error in your UI file
// final authProvider = Provider((ref) {
//   // You can return your future authentication controller/state here later
//   return null; 
// });