
import 'package:flutter/material.dart';

import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:planets_app/utils/app_routse.dart';
import 'package:planets_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'component/view/network_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NetworkProvider()..checkConnectivity()),
        ChangeNotifierProvider.value(
          value: HomeProvider()..getTheme(),
        ),
      ],
      child: Consumer<HomeProvider>(builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:value.theme =="Light"
            ?ThemeMode.light
            :value.theme=="Dark"
            ?ThemeMode.dark
            :ThemeMode.system,
        routes: app_routse,
      ),
      ),
    ),
  );
}