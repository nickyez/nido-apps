import 'package:flutter/material.dart';
import 'package:montesori/components/exit_button.dart';
import 'package:montesori/components/star.dart';
import 'package:montesori/config/color.dart';
import 'dart:math' as math;

import 'package:montesori/models/huruf.dart';

class GameHuruf extends StatefulWidget {
  final int index;
  const GameHuruf({Key? key, required this.index}) : super(key: key);

  @override
  _GameHurufState createState() => _GameHurufState();
}

class _GameHurufState extends State<GameHuruf> {
  double widthBox = 427.52;
  late int index = widget.index;
  bool isTap = false;

  void replay() {
    setState(() {
      index = 0;
      widthBox = 427.52;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/game_menu_screen/gs_huruf.jpg'),
              fit: BoxFit.fill)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // * Content
          content(index),
          // * Navigator
          index != 0
              ? Positioned(
                  left: 40,
                  child: SizedBox(
                    child: Material(
                        type: MaterialType.circle,
                        color: ColorApps.menuAngka,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              index--;
                              widthBox = 427.52;
                              isTap = false;
                            });
                          },
                          icon: Icon(Icons.arrow_back_ios_outlined,
                              size: 32, color: ColorApps.white),
                        )),
                  ))
              : SizedBox(),
          index < Huruf.title.length - 1
              ? Positioned(
                  right: 40,
                  child: SizedBox(
                    child: Material(
                        type: MaterialType.circle,
                        color: ColorApps.menuAngka,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              index++;
                              widthBox = 427.52;
                              isTap = false;
                            });
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined,
                              size: 32, color: ColorApps.white),
                        )),
                  ))
              : SizedBox(),
          // * Star
          Positioned(
              top: 20,
              left: 13,
              child: SizedBox(
                  width: 125,
                  child: Star(
                    /**
                     * ? Scoring Game huruf
                     * ! Bintang 1 : a - j = [0] - [9]
                     * ! Bintang 2 : k - t = [10] - [19]
                     * ! Bintang 3 : u - z = [20] - [25]
                     */
                      star: index <= 9
                          ? 1
                          : index >= 10 && index <= 19
                              ? 2
                              : 3))),
          // * Setting Button
          Positioned(
              top: 20,
              right: 20,
              child: ExitButton(
                  replay: replay, predicate: (route) => route.isFirst))
        ],
      ),
    ));
  }

  Widget content(int index) {
    return Center(
      child: SizedBox(
        width: 427.52,
        height: 241,
        child: Stack(children: [
          // * White box with image
          Container(
            width: 427.52,
            height: 241,
            padding: const EdgeInsets.only(left: 169),
            decoration: BoxDecoration(
                color: ColorApps.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF4A3A22).withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(4, 4))
                ]),
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isTap = true;
                    });
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // * Alas warna ijo
                      // Positioned(
                      //     bottom: -10,
                      //     child: ClipOval(
                      //       child: Container(
                      //           width: 197,
                      //           height: 41,
                      //           decoration: BoxDecoration(
                      //               color: Color(0xFF95A74A),
                      //       )),
                      //     )),
                      // * Image
                      Image.asset(
                          !isTap
                              ? Huruf.imageUrl[index]
                              : Huruf.imageUrlAfter[index],
                          width: 197,
                          height: 139),
                    ],
                  )),
            ),
          ),
          // * Colorful Box with description
          GestureDetector(
            onTap: () {
              setState(() {
                if (widthBox == 427.52) {
                  widthBox = 169;
                }
              });
            },
            child: AnimatedContainer(
                width: widthBox,
                height: 241,
                duration: const Duration(milliseconds: 400),
                child: widthBox == 169
                    ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Text(Huruf.title[index],
                                    style: TextStyle(
                                        color: Huruf.colorHuruf[index],
                                        fontSize: 42,
                                        fontWeight: FontWeight.w800)),
                                Text(Huruf.title[index],
                                    style: TextStyle(
                                        fontSize: 42,
                                        fontWeight: FontWeight.w800,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = Huruf.colorStroke[index]))
                              ],
                            ),
                            Text(Huruf.subTitle[index],
                                style: TextStyle(
                                    color: ColorApps.white,
                                    fontSize: index != 14 ? 24 : 20,
                                    fontWeight: FontWeight.w800))
                          ],
                        ),
                      )
                    : Center(
                        child: Stack(
                          children: [
                            Text(Huruf.title[index],
                                style: TextStyle(
                                  color: Huruf.colorHuruf[index],
                                  fontSize: 42,
                                  fontWeight: FontWeight.w800,
                                )),
                            Text(Huruf.title[index],
                                style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.w800,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2
                                      ..color = Huruf.colorStroke[index])),
                          ],
                        ),
                      ),
                decoration: BoxDecoration(
                    color: Huruf.colorBg[index],
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8),
                        right: widthBox == 169
                            ? Radius.zero
                            : Radius.circular(8)))),
          ),
        ]),
      ),
    );
  }
}
