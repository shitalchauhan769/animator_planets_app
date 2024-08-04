import 'package:flutter/material.dart';
class Network_Widget extends StatelessWidget {
  const Network_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/image/img.png")),
        ],
      ),
    );
  }
}