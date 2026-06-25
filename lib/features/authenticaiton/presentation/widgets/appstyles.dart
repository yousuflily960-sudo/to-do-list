
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appcolors.dart';
import 'package:to_do_list/ulits/size_config.dart';

class AppStyles {
	static final headingTestStyle = GoogleFonts.mcLaren(
		fontSize: SizeConfig.getProportionateHeight(22),
		fontWeight: FontWeight.w600,
		color: AppColors.back,
	);

	static final titleTestStyle = GoogleFonts.mcLaren(
		fontSize: SizeConfig.getProportionateHeight(30),
		fontWeight: FontWeight.w600,
		color: AppColors.back,
	);
  // 	static final subtitleTestStyle = GoogleFonts.mcLaren(
	// 	fontSize: SizeConfig.getProportionateHeight(24),
	// 	fontWeight: FontWeight.w600,
	// 	color: AppColors.second,
	// );

	static final normalTestStyle = GoogleFonts.mcLaren(
		fontSize: SizeConfig.getProportionateHeight(12),
		fontWeight: FontWeight.w100,
		color: const Color.fromARGB(255, 253, 253, 253),
	);

	static final buttonTextStyle = GoogleFonts.mcLaren(
		fontSize: SizeConfig.getProportionateHeight(22),
		fontWeight: FontWeight.w600,
		color: AppColors.paleGreen,
	);
}
