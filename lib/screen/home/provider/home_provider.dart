import 'package:flutter/cupertino.dart';
import 'package:planets_app/utils/shared_preferences.dart';

import '../../../utils/json_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier {
  List<PlanetsModel> planetsList = [];
  List<String> bookMarkNameList = [];
  List<String> bookMarkImageList = [];
  SharedHelper helper = SharedHelper();

  Future<void> getPlanets() async {
    JsonAPIHelper helper = JsonAPIHelper();
    planetsList = await helper.planetsAPI();
    notifyListeners();
  }

  Future<void> setBookMark(String? name, String? image) async {
    bookMarkNameList.add(name!);
    bookMarkImageList.add(image!);
    helper.setBookMark(bookMarkNameList, bookMarkImageList);

    notifyListeners();
  }

  void getData() async{
    var data = await helper.getNameBookMark();
    var data2 = await helper.getImageBookMark();

    if(data != null && data2 !=null)
      {
        bookMarkNameList = data;
        bookMarkImageList = data2;
      }

    notifyListeners();

  }
}
