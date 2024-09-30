import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset("assets/error.png"),
    const Text("Data Not Found.",
    style: TextStyle(fontSize: 25,
    
    ),
    ),
    ],
    ),
    );
  }
}