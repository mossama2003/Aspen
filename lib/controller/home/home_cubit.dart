import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aspen/controller/home/home_state.dart';
import 'package:aspen/core/storage/db_helper.dart';
import 'package:aspen/core/storage/end_points.dart';
import 'package:aspen/model/home/place_model.dart';
import 'package:aspen/model/place_details/facility_model.dart';
import '../../model/home/category_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<CategoryModel> categories = [];
  List<PlaceModel> places = [];
  List<PlaceModel> favPlaces = [];
  List<PlaceModel> popularPlaces = [];
  List<PlaceModel> recommendedPlaces = [];

  List<FacilityModel> allFacilities = [];
  List<PlaceFacilitiesModel> placeFacilities = [];

  late int selectedCategoryId = categories[0].id;

  void changeCategoryId(int id) {
    selectedCategoryId = id;
    if (id == -1) {
      popularPlaces = places;
    } else {
      popularPlaces = [];
      for (PlaceModel item in places) {
        if (item.catID == id) {
          popularPlaces.add(item);
        }
      }
    }
    emit(ChangeCategoryState());
  }

  Future<void> getAllData() async {
    await getCategories();
    await getFacilities();
    await getPlaceFacilities();
    await getPlaces();
  }

  Future<void> getCategories() async {
    try {
      emit(LoadingGetDataState());
      categories = CategoryModel.formMapList(await DbHelper.select(
        sql: 'SELECT * FROM $CATEGORIES_TABLE',
      ));
      categories.insert(0, const CategoryModel(id: -1, name: 'All'));
      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  Future<void> getPlaces() async {
    try {
      emit(LoadingGetDataState());
      places = PlaceModel.fromListMap(
        await DbHelper.select(
          sql: 'select * from $PLACES_TABLE',
        ),
      );

      /// 1, 2, 3
      /// id - place id - fac id
      for (PlaceFacilitiesModel item in placeFacilities) {
        places.firstWhere((place) => place.id == item.placeId).facilities.add(
              allFacilities.firstWhere((fs) => fs.id == item.facilityId),
            );
      }

      recommendedPlacesHandler();
      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  void handleFavPlaces() {
    favPlaces.clear();
    for (PlaceModel item in places) {
      if (item.isFav == 1) {
        favPlaces.add(item);
      }
    }
    emit(UpdateUiState());
  }

    Future<void> getFacilities() async {
    try {
      emit(LoadingGetDataState());

      allFacilities = FacilityModel.fromListMap(
        await DbHelper.select(sql: 'SELECT * FROM $FACILITIES_TABLE'),
      );

      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  Future<void> getPlaceFacilities() async {
    try {
      emit(LoadingGetDataState());

      placeFacilities = PlaceFacilitiesModel.fromListMap(
        await DbHelper.select(sql: 'SELECT * FROM $PLACE_FACILITIES_TABLE'),
      );

      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  void recommendedPlacesHandler() {
    popularPlaces = places;
    recommendedPlaces = [];

    for (PlaceModel item in places) {
      if (item.label != null) {
        recommendedPlaces.add(item);
      }
    }
  }

  Future<void> toggleFav(int id, int currentValue) async {
    try {
      final int isFav = currentValue == 1 ? 0 : 1;
      await DbHelper.update(
        sql: 'UPDATE $PLACES_TABLE SET $IS_FAV = $isFav WHERE $ID = $id',
      );
      places.firstWhere((element) => element.id == id).isFav = isFav;
      emit(SuccessGetDataState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorGetDataState());
    }
  }

  Future<void> add() async {
    await DbHelper.insert(sql:
    '''
    INSERT INTO $PLACE_FACILITIES_TABLE ($PLACE_ID, $FACILITY_ID) VALUES (6, 4)
    ''');
    print(await DbHelper.select(sql: 'SELECT * FROM $PLACE_FACILITIES_TABLE'));
    // print(await DbHelper.select(sql: 'SELECT * FROM $PLACES_TABLE'));
    print('done');
  }

  Future<void> addData() async {

    await DbHelper.insert(
      // sql: 'INSERT INTO $CATEGORIES_TABLE ($NAME) VALUES ("Adventure")'

      sql: '''
        INSERT INTO $PLACES_TABLE (
        $NAME,
        $IMAGE,
        $RATE,
        $REVIEWERS,
        $IS_FAV,
        $DESCRIPTION,
        $PRICE,
        $CATEGORY_ID
        ) VALUES (
          "7 Mehmet",
           "https://yummyistanbul.com/wp-content/uploads/2021/11/7-mehmet-antalya-1024x576.webp",
           4.2,
           941456,
           0,
           "With marvelous views, a well-stocked bar, and a fantastic selection of breakfast dishes, starters, and main courses, this is the place for a late breakfast, brunch, lunch, dinner, or even better, an all-day-long gastro feast.There’s a wide variety of egg-based dishes (yumurta): if you want it with spicy, garlicky Turkish sausage (sucuklu yumurta), with minced meat (kıymalı yumurta) or tangy Turkish omelet (menemen), you’re in luck!You have the meze classics, and then you have inspirational twists such as the acılı haydari cevizli; thick tzatziki with a hint of crunchy walnuts and alluring chili. The lahana sarma (stuffed cabbage) is out of this world. Those are just the starters!When you do visit, don’t neglect the main courses and specials. You might find a delicious diet-friendly avocado salad (avokadolu kırma salata) with its seasonal greens, avocado, cauliflower with a dressing consisting of zesty lemon and olive oil sauce. Further, if you miss the tandoori goat with its bergamot jam and rice with pineapples and almonds (oğlak tandır), you may regret it.",
           220,
           3
        )''',
    );
    print(await DbHelper.select(sql: 'SELECT * FROM $PLACES_TABLE'));
    print('Done');
  }

  Future<void> deleteData() async {
    try {
      await DbHelper.delete(sql: '$PLACES_TABLE WHERE $DESCRIPTION = "Welcome to Megasaray WestBeach Antalya, your Antalya “home away from home.” Megasaray WestBeach Antalya aims to make your visit as relaxing and enjoyable as possible, which is why so many guests continue to come back year after year. Guest rooms offer a flat screen TV, air conditioning, and a minibar, and Megasaray WestBeach Antalya makes getting online easy as free wifi is available. You can also take advantage of some of the amenities offered by the hotel, including room service and a concierge. In addition, guests can enjoy a pool and free breakfast during their visit. As an added convenience, there is free parking available to guests. Antalya is also home to Hadrian\'s Gate, a popular historic site that is not too far from Megasaray WestBeach Antalya. Megasaray WestBeach Antalya puts the best of Antalya at your fingertips, making your stay both relaxing and enjoyable. Megasaray Westbeach Antalya, located on the world-famous Konyaaltı Beach, the most beautiful location in Antalya, and aiming to provide you with an unforgettable holiday experience, will be working for you to collect wonderful memories from the moment you enter the door to your last minute."');
    } catch (e) {
      print(e);
    }
    print('Done');
  }
}