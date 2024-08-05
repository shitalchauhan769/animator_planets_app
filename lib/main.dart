
import 'package:flutter/material.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:planets_app/utils/app_routse.dart';
import 'package:planets_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'component/provider/network_provider.dart';



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
      child: Consumer<HomeProvider>(builder: (context, value, child) {
        value.getTheme();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: value.themeName ==false?lightTheme:darkTheme,
          routes: app_routse,
        );
      },
      ),
    ),
  );
}