import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// go_router adds navigation helper methods to BuildContext.
//
// Because of this import, we can write:
//
// context.goNamed(...)
//
// instead of using Navigator.push(...)
//
// Your app is already using MaterialApp.router in main.dart,
// so go_router is the correct navigation system here.
import 'package:go_router/go_router.dart';

import 'package:to_do_list/features/authenticaiton/presentation/controlers/auth_controller.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appcolors.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appstyles.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/common_text_fields.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/nature_auth_layout.dart';

// router.dart contains the AppRoutes enum.
//
// AppRoutes.register.name gives us the route name "register".
//
// This is safer than typing:
//
// context.goNamed('register')
//
// because if we mistype the route name, Dart cannot help us.
import 'package:to_do_list/routes/router.dart';

import 'package:to_do_list/ulits/size_config.dart';

// ConsumerStatefulWidget = allows Riverpod + setState together
class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? error; // simple error state (we can upgrade later with Riverpod)

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return NatureAuthLayout(
      title: 'Welcome Back!',
      subtitle: 'Login to continue your journey',
      formTitle: 'Login',
      children: [
        // EMAIL FIELD
        TextFieldWidget(
          name: emailController,
          hint: 'email',
          errorText: error,
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(16)),

        // PASSWORD FIELD
        TextFieldWidget(
          name: passwordController,
          hint: 'password',
          obscureText: true,
          errorText: error,
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(24)),

        // LOGIN BUTTON
        GestureDetector(
          onTap: () async {
            try {
              await ref
                  .read(authControllerProvider.notifier)
                  .signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

              if (!mounted) return;

              setState(() {
                error = null;
              });
            } catch (e) {
              if (!mounted) return;

              // Firebase error handling
              setState(() {
                error = "Invalid email or password";
              });
            }
          },

          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.getProportionateHeight(14),
            ),
            decoration: BoxDecoration(
              color: AppColors.buttons,
              borderRadius: BorderRadius.circular(36),
            ),

            child: Center(
              child: Text('Login', style: AppStyles.buttonTextStyle),
            ),
          ),
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(28)),

        // OR DIVIDER (RESPONSIVE)
        Row(
          children: [
            Expanded(child: Container(height: 3, color: Color.fromARGB(255, 255, 255, 255))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('OR', style: AppStyles.headingTestStyle),
            ),
            Expanded(child: Container(height: 3, color: Color.fromARGB(255, 255, 255, 255))),
          ],
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(28)),

        // GOOGLE BUTTON (UI only for now)
        Center(
          child: Container(
            height: SizeConfig.getProportionateHeight(60),
            width: SizeConfig.getProportionateHeight(60),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.input,
              border: Border.all(color: AppColors.leaf, width: 2),
            ),
            child: const FittedBox(
              child: FaIcon(FontAwesomeIcons.google, color: AppColors.error),
            ),
          ),
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(10)),

        Center(
          child: TextButton(
            onPressed: () {
              // This moves the user from SignInScreen to RegisterScreen.
              //
              // goNamed means:
              //
              // "Go to the route with this name."
              //
              // In router.dart, you already created:
              //
              // GoRoute(
              //   path: '/register',
              //   name: AppRoutes.register.name,
              //   builder: (context, state) => const RegisterScreen(),
              // )
              //
              // So this button opens the /register route.
              //
              // Riverpod is not needed for this button because
              // changing screens is navigation, not app state.
              context.goNamed(AppRoutes.register.name);
            },
            child: const Text("Don't have an account?"),
          ),
        ),
      ],
    );
  }
}
