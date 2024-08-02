import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  HomeProvider? providerW;
  HomeProvider? providerR;
  int? index;
  AnimationController? animationController;

  // Animation? sizeTween;
  // Animation? colorsTween;

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
    index = ModalRoute.of(context)!.settings.arguments as int;
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              providerR!.setBookMark(providerW!.planetsList[index!].name, providerW!.planetsList[index!].image);
            },
            icon: const Icon(Icons.favorite,color: Colors.white),
          ),
        ],
        backgroundColor: const Color(0xff050214),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              image: const AssetImage("assets/video/video1.gif"),
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(200),
                        bottomLeft: Radius.circular(200),
                      ),
                    ),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: index != 8
                          ? RotationTransition(
                              turns: animationController!,
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Hero(
                                  tag: "$index",
                                  child: Image(
                                    image: NetworkImage(
                                        "${providerW!.planetsList[index!].image}"),
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 150,
                              width: 150,
                              child: Hero(
                                tag: "$index",
                                child: Image(
                                  image: NetworkImage(
                                      "${providerW!.planetsList[index!].image}"),
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          WavyAnimatedText(
                            "${providerW!.planetsList[index!].name}",
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          // TyperAnimatedText(
                          //   "name:=${providerW!.planetsList[index!].name}",
                          //   textStyle: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 25,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            "position:${providerW!.planetsList[index!].position}",
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            "distance:${providerW!.planetsList[index!].distance}",
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                              'description:=${providerW!.planetsList[index!].description}',
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.justify),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
