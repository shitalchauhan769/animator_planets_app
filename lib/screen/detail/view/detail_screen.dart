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

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  int? index;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanets();
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)!.settings.arguments as int;
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    return Scaffold(
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
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "detail",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/video/video2.gif"),
                        fit: BoxFit.cover),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Hero(
                      tag: "$index",
                      child: Image(
                        image: NetworkImage(
                            "${providerW!.planetsList[index!].image}"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          providerW!.planetsList[index!].name!,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                            '${providerW!.planetsList[index!].description}',
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.justify),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
