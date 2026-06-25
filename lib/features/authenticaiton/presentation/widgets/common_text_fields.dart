import 'package:flutter/material.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appcolors.dart';

// Widget names should start with a capital letter
class TextFieldWidget extends StatelessWidget {
  final TextEditingController name;
  final String hint;

  // Nullable because sometimes there is no error
  final String? errorText;

  // Optional password field
  final bool obscureText;

  const TextFieldWidget({
    super.key,
    required this.name,
    required this.hint,
    this.errorText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: name,

      // Set true only for passwords
      obscureText: obscureText,

      // User typed text color
      style: TextStyle(
        color: AppColors.text,
      ),

      decoration: InputDecoration(
        // Background color only works when filled = true
        filled: true,
        fillColor: AppColors.input,

        // Placeholder text
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.forest,
        ),

        // Error message displayed under field
        errorText: errorText,

        // Error message color
        errorStyle: TextStyle(
          color: AppColors.error,
          fontSize: 12,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: AppColors.leaf,
            width: 4,
          ),
        ),

        // Border when there is an error
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),

        // Border when focused and there is an error
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 4,
          ),
        ),
      ),
    );
  }
}
