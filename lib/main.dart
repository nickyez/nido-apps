import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:montesori/screens/loadingscreen.dart';
void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rounded Mplus 1c'
      ),
      home: const LoadingScreen(),
    );
  }
}