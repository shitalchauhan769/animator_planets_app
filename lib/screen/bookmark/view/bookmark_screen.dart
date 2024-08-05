import 'package:flutter/material.dart';
import 'package:planets_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen>
    with TickerProviderStateMixin {
  HomeProvider? providerW;
  HomeProvider? providerR;
  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getData();
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Bookmark",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: providerW!.themeName
            ? const Color(0xff365b9a)
            : const Color(0xff050214),
      ),
      body: Stack(
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
          ListView.builder(
            itemCount: providerW!.bookMarkNameList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                   Container(
                     height: 100,
                     width: MediaQuery.sizeOf(context).width,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.white.withOpacity(0.2),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Text(
                             providerW!.bookMarkNameList[index],
                             style: const TextStyle(
                                 color: Colors.white,
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold),
                           ),
                           const Spacer(),
                           index != 8
                               ? RotationTransition(
                             turns: animationController!,
                             child: Image(
                               image: NetworkImage(
                                 providerW!.bookMarkImageList[index],
                               ),
                               height: 60,
                               width: 60,
                             ),
                           )
                               : Image(
                             image: NetworkImage(
                               providerW!.bookMarkImageList[index],
                             ),
                             height: 60,
                             width: 60,
                           ),
                           IconButton(onPressed: () {
                             providerR!.removeBookMark(providerW!.bookMarkNameList[index],providerW!.bookMarkImageList[index]);
                           }, icon: const Icon(Icons.delete),color: Colors.white,),
                         ],
                       ),
                     ),
                   ),

                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
