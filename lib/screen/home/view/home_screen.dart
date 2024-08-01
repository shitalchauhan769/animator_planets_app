import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:planets_app/screen/home/model/home_model.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  HomeProvider? providerW;
  HomeProvider? providerR;
  AnimationController? animationController;
  Animation? sizeTween;
  Animation? colorsTween;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanets();
    animationController=AnimationController(vsync:this ,duration: const Duration(seconds: 2));
    sizeTween =Tween<double>(end: 0,begin: 5).animate(animationController!);
    colorsTween=Tween<double>(begin:0 ,end:5 ).animate(animationController!);
    animationController!.repeat(reverse: true);

  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: const AssetImage("assets/video/video1.gif"),
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
              mainAxisSpacing: 5,
              childAspectRatio: 5
            ),
            itemCount: providerW!.planetsList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "detail",arguments: index);
                    },
                    child: AnimatedBuilder(
                      animation: animationController!,
                      builder: (context, child) {
                      return  Transform.translate(
                          // angle: (pi*2) * animationController!.value,
                          // scale:sizeTween!.value,
                          offset:  Offset(0,100*animationController!.value),
                          child: child,
                        );
                      },
                      child: Container(
                         height: 180,
                        width: 180,
                        child: Hero(
                          tag: "$index",
                          child: Image(
                            image: NetworkImage(
                                "${providerW!.planetsList[index].image}"),fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          ),
                        ),
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
      ),
    );
  }
}
