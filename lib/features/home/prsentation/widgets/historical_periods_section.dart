import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_header_text.dart';
import 'historical_periodos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection(FireBaseStrings.historicalPeriods)
            .get(),
        builder: (context, snapshot) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeaderText(text: AppStrings.historicalPeriods),
              SizedBox(height: 16),
              HistoricalPeridos(),
            ],
          );
        });
  }
}
