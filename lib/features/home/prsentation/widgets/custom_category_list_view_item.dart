import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_styles.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ]),
      child: Column(
        children: [
          Container(
            width: 74,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                image: AssetImage(AppAssets.imagesFrame3),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            "Lionheart",
            style: AppStyles.s14,
          )
        ],
      ),
    );
  }
}
