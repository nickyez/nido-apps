import 'package:flutter/material.dart';
import 'dart:async';
import 'package:montesori/config/color.dart';
import 'package:montesori/screens/homescreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    percen();
    loadingScreen();
  }

  var percentage = 0;
  loadingScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    });
  }

  percen() async {
    var time = const Duration(seconds: 1);
    return Timer.periodic(time, (timer) {
      if (percentage == 100) {
        timer.cancel();
      }
      if (mounted) {
        setState(() {
          percentage += 20;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApps.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/loading_screen/ic_loading_screen.png',
                  width: 69, height: 90),
              Text("$percentage%",
                  style: const TextStyle(
                      color: ColorApps.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800))
            ],
          ),
        ));
  }
}
