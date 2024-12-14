import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/data_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem(
      {super.key, required this.model, required this.routePath});
  final DataModel model;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, routePath, extra: model);
      },
      child: Container(
        height: 96,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey,
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
        ),
        child: ItemComponantWidget(model: model),
      ),
    );
  }
}

class ItemComponantWidget extends StatelessWidget {
  const ItemComponantWidget({
    super.key,
    required this.model,
  });

  final DataModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 16),
        SizedBox(
          height: 48,
          width: 62,
          child: Text(
            model.name,
            style: AppStyles.s16.copyWith(color: AppColors.deepBrown),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 6),
        SizedBox(
          height: 100,
          width: 60,
          child: CachedNetworkImage(
            imageUrl: model.image,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: Colors.white,
              child: Container(
                width: 47,
                height: 64,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16)
      ],
    );
  }
}
