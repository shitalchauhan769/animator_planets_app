import 'package:flutter/material.dart';
import 'package:planets_app/screen/bookmark/view/bookmark_screen.dart';
import 'package:planets_app/screen/detail/view/detail_screen.dart';
import 'package:planets_app/screen/home/view/home_screen.dart';
import '../screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder>app_routse={
  '/':(c1)=>const SplashScreen(),
  'home':(c1)=>const HomeScreen(),
  'detail':(c1)=>const DetailScreen(),
  'bookmark':(c1)=>const BookmarkScreen(),
};