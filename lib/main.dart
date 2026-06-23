import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:to_do_list/features/authenticaiton/presentation/widgets/appcolors.dart';
import 'package:to_do_list/ulits/firebase_options.dart';
import 'package:to_do_list/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'Todo App Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.leaf,
          primary: AppColors.leaf,
          secondary: AppColors.accent,
          error: AppColors.error,
          surface: AppColors.field,
        ),
        scaffoldBackgroundColor: AppColors.back,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: AppColors.leaf,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          backgroundColor: AppColors.leaf,
          selectedItemColor: AppColors.paleGreen,
          unselectedItemColor: AppColors.forest,
        ),
        useMaterial3: true,
      ),
    );
  }
}
