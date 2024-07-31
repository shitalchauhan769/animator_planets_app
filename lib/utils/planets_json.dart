import 'dart:convert';
import 'package:flutter/services.dart';
import '../screen/home/model/home_model.dart';

class JsonAPIHelper
{
  Future<List<PlanetsModel>> planetsAPI()
  async {
    var jsonString= await rootBundle.loadString("assets/json/planet.json");
    List json = jsonDecode(jsonString);

    List<PlanetsModel> planetsList = json .map((e) => PlanetsModel.mapToModel(e)).toList();
    return planetsList;
  }
}