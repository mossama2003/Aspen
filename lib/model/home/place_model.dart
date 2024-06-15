import 'package:aspen/core/storage/end_points.dart';

import '../place_details/facility_model.dart';

class PlaceModel {
  final int id;
  final String name;
  final String image;
  final double rate;
  final int reviewers;
  int isFav;
  final String description;
  final String? label;
  final String? reason;
  final double prices;
  final int catID;
  List<FacilityModel> facilities;

  PlaceModel({
    required this.id,
    required this.image,
    required this.name,
    required this.reviewers,
    required this.description,
    required this.prices,
    required this.catID,
    required this.rate,
    this.reason,
    this.label,
    required this.isFav,
    required this.facilities,
  });

  factory PlaceModel.fromMap(Map<String, dynamic> data) => PlaceModel(
        id: data[ID],
        image: data[IMAGE],
        name: data[NAME],
        reviewers: data[REVIEWERS],
        description: data[DESCRIPTION],
        prices: data[PRICE],
        catID: data[CATEGORY_ID],
        rate: data[RATE],
        reason: data[REASON],
        label: data[LABEL],
        isFav: data[IS_FAV],
        facilities: [],
      );

  static List<PlaceModel> fromListMap(List<Map<String, dynamic>> data) {
    return data.map((item) => PlaceModel.fromMap(item)).toList();
  }
}
