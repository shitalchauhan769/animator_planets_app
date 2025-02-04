import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:planets_app/component/provider/network_provider.dart';
import 'package:planets_app/screen/home/model/home_model.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../component/view/network_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerW;
  HomeProvider? providerR;
  AnimationController? animationController;
  Animation? sizeTween;
  Animation? colorsTween;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanets();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animationController!.repeat(reverse: false);
    animationController!.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Galaxy Planets",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'bookmark');
            },
            icon: const Icon(Icons.bookmark, color: Colors.white),
          ),
          Switch(value: providerW!.theme!, onChanged: (value) {
            providerR!.setTheme(true);
          },)
        ],
        backgroundColor: providerW!.themeName
            ? const Color(0xff365b9a)
            : const Color(0xff050214),
      ),
      body: context.read<NetworkProvider>().isInternet
          ? Stack(
              alignment: Alignment.center,
              children: [
                providerW!.themeName
                    ? Image(
                        image: const AssetImage("assets/video/video3.gif"),
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                      )
                    : Image(
                        image: const AssetImage("assets/video/video1.gif"),
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                      ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemCount: providerW!.planetsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "detail",
                                arguments: index);
                          },
                          child: Center(
                            child: Column(
                              children: [
                                index != 8
                                    ? RotationTransition(
                                        turns: animationController!,
                                        child: SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: Hero(
                                            tag: "$index",
                                            child: Image(
                                              image: NetworkImage(
                                                  "${providerW!.planetsList[index].image}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        width: 150,
                                        height: 150,
                                        child: Hero(
                                          tag: "$index",
                                          child: Image(
                                            image: NetworkImage(
                                                "${providerW!.planetsList[index].image}"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "${providerW!.planetsList[index].name}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                )
              ],
            )
          : const Network_Widget(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
