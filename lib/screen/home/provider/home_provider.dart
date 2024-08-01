import 'package:flutter/cupertino.dart';


import '../../../utils/json_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier
{
  List<PlanetsModel> planetsList=[];
   Future<void> getPlanets()
   async {
     JsonAPIHelper helper=JsonAPIHelper();
     planetsList = await helper.planetsAPI();
     notifyListeners();
   }
}