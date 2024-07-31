import 'package:flutter/material.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanets();
  }
  @override
  Widget build(BuildContext context) {
    providerR=context.read<HomeProvider>();
    providerW=context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: providerW!.planetsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text('${providerW!.planetsList[index].description}'),
            Text('${providerW!.planetsList[index].name}'),
            ],
          );
        },
      ),
    );
  }
}
