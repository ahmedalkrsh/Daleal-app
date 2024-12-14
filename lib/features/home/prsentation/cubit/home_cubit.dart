import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/app_strings.dart';
import '../../data/models/historical_periods_model.dart';
import '../../data/models/wars_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<WarsModel> warsList = [];

  getHistoricalPeriods() async {
    if (kDebugMode) {
      print("*******************THIS METHOD");
    }
    try {
      emit(GetHistoricalPeriodLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then(
            (value) => value.docs.forEach(
              (element) async {
                await getWarsList(element);
                historicalPeriods.add(
                  HistoricalPeriodsModel.fromJson(
                    element.data(),
                    warsList,
                  ),
                );
                emit(GetHistoricalPeriodSuccess());
              },
            ),
          );
    } catch (e) {
      emit(GetHistoricalPeriodFailure(e.toString()));
    }
  }

  Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection(FireBaseStrings.wars)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              warsList.add(
                WarsModel.fromJson(
                  element.data(),
                ),
              );
            },
          ),
        );
  }
}
