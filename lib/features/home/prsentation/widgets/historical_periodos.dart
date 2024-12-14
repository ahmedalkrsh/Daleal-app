import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/features/home/prsentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_data_list_view.dart';
import '../../../../core/widgets/custom_shimmer_category.dart';


class HistoricalPeridos extends StatelessWidget {
  const HistoricalPeridos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodFailure) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodLoading
            ? const CustomShimmerCategory()
            : CustomDataListView(
                dataList: context.read<HomeCubit>().historicalPeriods,
                routPath: RouterNames.HistoricalPeriodsDetailsView,
              );
      },
    );
  }
}
