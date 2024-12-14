
import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_data_list_view.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/prsentation/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/period_detaild_section_widget.dart';


class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});

  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomHomeViewAppBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 7)),
          SliverToBoxAdapter(
            child: PeriodDetaildSection(
              periodName: model.name,
              description: model.description,
              image: model.image,
            ),
          ),
          SliverToBoxAdapter(
            child: PeriodWarsSection(
              warsList: model.wars,
            ),
          )
        ],
      ),
    ));
  }
}

class PeriodWarsSection extends StatelessWidget {
  const PeriodWarsSection({super.key, required this.warsList});
  final List<DataModel> warsList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderText(text: AppStrings.historicalPeriods),
        CustomDataListView(dataList: warsList, routPath: ''),
        const SizedBox(height: 16),
      ],
    );
  }
}
