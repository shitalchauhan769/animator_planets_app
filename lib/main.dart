import 'package:flutter/material.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:planets_app/utils/app_routse.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: HomeProvider()),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routse,
      ),
    ),
  );
}
