import 'package:aspen/core/storage/end_points.dart';

class FacilityModel {
  final int id;
  final String name;
  final String image;

  FacilityModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory FacilityModel.fromMap(Map<String, dynamic> data) => FacilityModel(
        id: data[ID],
        name: data[NAME],
        image: data[IMAGE],
      );

  static List<FacilityModel> fromListMap(List<Map<String, dynamic>> data) {
    return data.map((item) => FacilityModel.fromMap(item)).toList();
  }
}

class PlaceFacilitiesModel {
  final int id;
  final int placeId;
  final int facilityId;

  PlaceFacilitiesModel({
    required this.id,
    required this.placeId,
    required this.facilityId,
  });

  factory PlaceFacilitiesModel.fromMap(Map<String, dynamic> data) =>
      PlaceFacilitiesModel(
        id: data[ID],
        placeId: data[PLACE_ID],
        facilityId: data[FACILITY_ID],
      );

  static List<PlaceFacilitiesModel> fromListMap(
      List<Map<String, dynamic>> data) {
    return data.map((item) => PlaceFacilitiesModel.fromMap(item)).toList();
  }
}
