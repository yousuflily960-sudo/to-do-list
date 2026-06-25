import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:to_do_list/features/authenticaiton/presentation/controlers/auth_controller.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appcolors.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appstyles.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/common_text_fields.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/nature_auth_layout.dart';
import 'package:to_do_list/routes/router.dart';

import 'package:to_do_list/ulits/size_config.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? error;

  bool validateDetails() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        error = 'Ensure all details are filled!';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ensure all details are filled!',
            style: AppStyles.normalTestStyle,
          ),
        ),
      );
      return false;
    }

    setState(() {
      error = null;
    });
    return true;
  }

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
      title: 'welcome to anjis!',
      subtitle: 'togather tawward a better us',
      formTitle: 'Sign Up',
      children: [
        TextFieldWidget(
          name: emailController,
          hint: 'email',
          errorText: error,
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(16)),

        TextFieldWidget(
          name: passwordController,
          hint: 'password',
          obscureText: true,
          errorText: error,
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(24)),

        // Sign Up button
        GestureDetector(
         onTap: () async {
  if (!validateDetails()) {
    return;
  }

  try {
  await ref
    .read(authControllerProvider.notifier)
    .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

final authState = ref.read(authControllerProvider);

print('AUTH STATE: $authState');

print(
  'CURRENT USER: ${FirebaseAuth.instance.currentUser?.email}',
);

print(
  'CURRENT UID: ${FirebaseAuth.instance.currentUser?.uid}',
);

    if (!context.mounted) return;

    context.goNamed(AppRoutes.main.name);
  } on FirebaseAuthException catch (e) {
    // DEBUG: Print Firebase error details
    print('Firebase Error Code: ${e.code}');
    print('Firebase Error Message: ${e.message}');

    setState(() {
      error = e.message ?? 'Could not create account';
    });
  } catch (e) {
    // DEBUG: Print any other unexpected errors
    print('Unexpected Error: $e');

    setState(() {
      error = 'Something went wrong. Please try again.';
    });
  }
},
          child: Container(
            width: double.infinity,

            // width: double.infinity makes the button
            // automatically fill available space
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.getProportionateHeight(14),
            ),

            decoration: BoxDecoration(
              color: AppColors.buttons,
              borderRadius: BorderRadius.circular(36),
            ),

            child: Center(
              child: Text('Sign Up', style: AppStyles.buttonTextStyle),
            ),
          ),
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(28)),

        // OR Divider
        // Expanded makes the lines responsive
        // on all screen sizes
        Row(
          children: [
            Expanded(child: Container(height: 3, color: AppColors.accent)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('OR', style: AppStyles.headingTestStyle),
            ),
            Expanded(child: Container(height: 3, color: AppColors.accent)),
          ],
        ),

        SizedBox(height: SizeConfig.getProportionateHeight(28)),

        // Google Button
        Center(
          child: Container(
            // Same width and height = perfect circle
            height: SizeConfig.getProportionateHeight(60),
            width: SizeConfig.getProportionateHeight(60),

            // Padding creates space between
            // icon and circle border
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.input,
              border: Border.all(color: AppColors.leaf, width: 2),
            ),

            child: const FittedBox(
              // FittedBox keeps icon looking good
              // on different screen sizes
              child: FaIcon(FontAwesomeIcons.google, color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }
}
