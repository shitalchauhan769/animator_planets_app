import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  Future<void> setBookMark(List<String> Name,List<String> Image)
  async {
     SharedPreferences shr= await SharedPreferences.getInstance();
     shr.setStringList("name", Name);
     shr.setStringList("image", Image);
  }

  Future<List<String>> getNameBookMark()
  async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    List<String> name=  shr.getStringList("name")??[];
    return name;
  }

  Future<List<String>> getImageBookMark()
  async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    List<String> image=  shr.getStringList("image")??[];
    return image;
  }


  Future<void> setThemeData(bool theme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool("theme", theme);
  }

  Future<bool?> getThemeData() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
  bool? theme = shr.getBool("theme");
    return theme;
  }

}