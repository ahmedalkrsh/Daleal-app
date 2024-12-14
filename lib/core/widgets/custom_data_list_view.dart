import 'package:flutter/material.dart';

import 'custom_data_list_view_item.dart';
import '../models/data_model.dart';

class CustomDataListView extends StatelessWidget {
  const CustomDataListView({
    super.key,
    required this.dataList,
    required this.routPath,
  });
  final List<DataModel> dataList;
  final String routPath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (context, Index) {
          return CustomDataListViewItem(
            model: dataList[Index],
            routePath: routPath,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}
