import 'package:evenodd/num-split-scrn.dart';
import 'package:evenodd/routes/route-name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(RouteName.numbersplitscreen);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 35, 62),
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Center(
            child: Center(
              child: Image.asset(
                'assets/images/coreteams logo.png',
                cacheHeight: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
