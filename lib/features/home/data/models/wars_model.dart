import 'package:dalel/core/utils/app_strings.dart';

import '../../../../core/models/data_model.dart';

class WarsModel extends DataModel {
  WarsModel({
    required super.name,
    required super.image,
    required super.description,
  });

  factory WarsModel.fromJson(jsonData) {
    return WarsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
    );
  }
}
