import 'package:flutter/material.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appcolors.dart';
import 'package:to_do_list/features/authenticaiton/presentation/widgets/appstyles.dart';
import 'package:to_do_list/ulits/size_config.dart';

class NatureAuthLayout extends StatelessWidget {
  const NatureAuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.formTitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final String formTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 146, 192, 179),
      body: SafeArea(
        child: Stack(
          children: [
            const _RedGreenBackground(),
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getProportionateWidth(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: SizeConfig.getProportionateHeight(42)),
                          Text(title, style: AppStyles.titleTestStyle),
                          SizedBox(height: SizeConfig.getProportionateHeight(8)),
                          Text(subtitle, style: AppStyles.headingTestStyle),
                          SizedBox(height: SizeConfig.getProportionateHeight(52)),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(
                              SizeConfig.getProportionateWidth(22),
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.forest,
                              borderRadius: BorderRadius.circular(18),
                             
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.forest.withValues(alpha: 0.14),
                                  blurRadius: 24,
                                  offset: const Offset(0, 14),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(formTitle, style: AppStyles.headingTestStyle),
                                SizedBox(
                                  height: SizeConfig.getProportionateHeight(20),
                                ),
                                ...children,
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.getProportionateHeight(30)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RedGreenBackground extends StatelessWidget {
  const _RedGreenBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 92,
            
          ),
        ),
        Positioned(
          bottom: 28,
          left: 32,
          right: 32,
          child: Container(
            height: 10,
           
          ),
        ),
      ],
    );
  }
}
