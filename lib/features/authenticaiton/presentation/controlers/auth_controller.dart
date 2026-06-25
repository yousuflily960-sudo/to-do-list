import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_list/features/authenticaiton/data/auth_repository.dart';
part 'auth_controller.g.dart';

// keepAlive: true means Riverpod will NOT destroy this controller
// as soon as the auth screen disappears.
//
// Why this matters here:
//
// 1. The user taps Sign Up.
// 2. Firebase starts an async create-user request.
// 3. Firebase logs the user in after the account is created.
// 4. GoRouter redirects from RegisterScreen to MainScreen.
// 5. The RegisterScreen is removed from the widget tree.
//
// If this provider is auto-disposed during step 5, the Firebase request
// may still be finishing. Then this controller tries to update `state`
// after it was disposed, and Riverpod throws UnmountedRefException.
//
// Auth actions are shared app behavior, so keeping this controller alive
// is a good fit.
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() async {
      await ref
          .read(authRepositoryProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
    });
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() async {
      await ref
          .read(authRepositoryProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    });
  }

  Future<void> signOut() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signOut();
    });
  }
}

















// // ===============================
// // APPLICATION LAYER (LOGIC)
// // ===============================
// //
// // This controls WHAT happens when user clicks buttons

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:to_do_list/features/authenticaiton/data/auth_repostry.dart';

// import 'auth_provider.dart';


// // ===============================
// // AUTH CONTROLLER
// // ===============================
// //
// // This is the "brain" of login/register actions
// class AuthController extends StateNotifier<AsyncValue<void>> {

//   final AuthRepository _repo;

//   // Constructor
//   AuthController(this._repo) : super(const AsyncData(null));

//   // ===============================
//   // SIGN IN ACTION
//   // ===============================
//   Future<void> signIn(String email, String password) async {
//     state = const AsyncLoading(); // show loading

//     try {
//       await _repo.signIn(email: email, password: password);
//       state = const AsyncData(null); // success
//     } catch (e, st) {
//       state = AsyncError(e, st); // error
//     }
//   }

//   // ===============================
//   // SIGN UP ACTION
//   // ===============================
//   Future<void> signUp(String email, String password) async {
//     state = const AsyncLoading();

//     try {
//       await _repo.signUp(email: email, password: password);
//       state = const AsyncData(null);
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

//   // ===============================
//   // SIGN OUT ACTION
//   // ===============================
//   Future<void> signOut() async {
//     await _repo.signOut();
//   }
// }


// // ===============================
// // PROVIDER FOR CONTROLLER
// // ===============================
// //
// // UI will use this
// final authControllerProvider =
//     StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
//   final repo = ref.watch(authRepositoryProvider);
//   return AuthController(repo);
// });
