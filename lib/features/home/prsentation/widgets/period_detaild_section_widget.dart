import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_header_text.dart';

class PeriodDetaildSection extends StatelessWidget {
  const PeriodDetaildSection(
      {super.key,
      required this.periodName,
      required this.description,
      required this.image});
  final String periodName;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(text: "${AppStrings.about} $periodName"),
            const SizedBox(width: 7),
            SvgPicture.asset(AppAssets.imagesDetails1),
          ],
        ),
        const SizedBox(height: 47),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -24,
                    child: SvgPicture.asset(AppAssets.imagesDetails2)),
                SizedBox(
                  height: 220,
                  width: 196,
                  child: Text(
                    description,
                    style: AppStyles.s16.copyWith(color: AppColors.black),
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            SizedBox(
              width: 131,
              height: 203,
              child: CachedNetworkImage(imageUrl: image),
            )
          ],
        )
      ],
    );
  }
}
