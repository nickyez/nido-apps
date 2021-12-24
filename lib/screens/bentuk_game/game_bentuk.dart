import 'dart:async';
import 'dart:math' as math;
import 'package:bubble/bubble.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:montesori/components/exit_button.dart';
import 'package:montesori/components/star.dart';
import 'package:montesori/components/win_condition.dart';
import 'package:montesori/config/color.dart';
import 'package:montesori/models/bentuk.dart';

class GameBentuk extends StatefulWidget {
  final String name, shapeTarget;
  const GameBentuk({Key? key, required this.name, required this.shapeTarget})
      : super(key: key);

  @override
  _GameBentukState createState() => _GameBentukState();
}

var target = "";

class _GameBentukState extends State<GameBentuk> {
  late String name = widget.name, shapeTarget = widget.shapeTarget;
  bool isCorrect = false;
  void replay() {
    setState(() {
      target = "";
      isCorrect = false;
    });
    Navigator.pop(context);
  }

  winCondition() async {
    var duration = const Duration(milliseconds: 800);
    return Timer(duration, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context2) => WinCondition(
                  replay: replay,
                  predicate: (route) => route.isFirst,
                  star: 1)));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      // * Background
      Positioned(
        top: screenSize.height * -0.2222222222222222,
        child: Container(
          constraints: BoxConstraints.expand(
              width: screenSize.width, height: screenSize.height),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bentuk/ic_bentuk_bg.png'),
                  fit: BoxFit.fitWidth)),
        ),
      ),
      // * Bubble
      Positioned(
          top: 20,
          right: screenSize.width * 0.45,
          child: SizedBox(
            width: 130,
            height: 30,
            child: Bubble(
                nip: BubbleNip.rightBottom,
                color: ColorApps.menuWarna,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Temukan ",
                        children: [
                          TextSpan(
                              text: name,
                              style:
                                  const TextStyle(color: ColorApps.menuBentuk))
                        ],
                        style: const TextStyle(
                            fontFamily: "Rounded Mplus 1c",
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: ColorApps.white)),
                  ),
                )),
          )),
      for (var i = 0; i < Bentuk.imageUrl.length; i++)
        targetShape(screenSize)[i],
      // * Bottom shape
      Positioned(
          bottom: 0,
          child: Container(
              width: screenSize.width,
              height: 100,
              decoration: const BoxDecoration(
                color: ColorApps.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Center(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500, mainAxisSpacing: 25),
                    scrollDirection: Axis.horizontal,
                    itemCount: Bentuk.imageUrl.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                          height: 70,
                          width: 85,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorApps.menuBentuk,
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: Draggable<String>(
                              data: Bentuk.imageUrl[index],
                              child: Bentuk.imageUrl[index] != target
                                  ? Image.asset(Bentuk.imageUrl[index],
                                      height: 55)
                                  : SizedBox(width: 55),
                              childWhenDragging: SizedBox(),
                              feedback: Image.asset(Bentuk.imageUrl[index],
                                  height: 55)));
                    }),
              ))),
      // * Star
      const Positioned(
          top: 20, left: 13, child: SizedBox(width: 125, child: Star(star: 0))),
      // * Setting
      Positioned(
          top: 20,
          right: 20,
          child: ExitButton(
              replay: replay,
              predicate: (route) {
                setState(() {
                  target = "";
                });
                return route.isFirst;
              })),
    ]));
  }

  List<Widget> targetShape(Size screenSize) {
    return [
      // Bintang
      Positioned(
        left: screenSize.width * 0.1041666666666667,
        bottom: screenSize.height * 0.3055555555555556,
        child: DragTarget<String>(
            onWillAccept: (value) =>
                value == shapeTarget && value == Bentuk.imageUrl[0]
                    ? true
                    : false,
            onAccept: (value) {
              setState(() {
                target = value;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context2) => WinCondition(
                            replay: replay,
                            predicate: (route) {
                              setState(() {
                                target = "";
                              });
                              return route.isFirst;
                            })));
              });
            },
            builder: (context, candidates, rejected) {
              return target == Bentuk.imageUrl[0] && target == shapeTarget
                  ? Image.asset(target, width: screenSize.width * 0.1171875)
                  : Container(
                      width: screenSize.width * 0.1171875,
                      height: screenSize.height * 0.25,
                    );
            }),
      ),
      // Persegi
      Positioned(
        top: screenSize.height * 0.1555555555555556,
        left: screenSize.width * 0.12630208,
        child: DragTarget<String>(
            onWillAccept: (value) =>
                value == shapeTarget && value == Bentuk.imageUrl[5]
                    ? true
                    : false,
            onAccept: (value) {
              setState(() {
                target = value;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context2) => WinCondition(
                            replay: replay,
                            predicate: (route) {
                              setState(() {
                                target = "";
                              });
                              return route.isFirst;
                            })));
              });
            },
            builder: (context, candidates, rejected) {
              return target == Bentuk.imageUrl[5] && target == shapeTarget
                  ? Image.asset(target, width: screenSize.width * 0.085)
                  : Container(
                      width: screenSize.width * 0.08,
                      height: screenSize.height * 0.180,
                    );
            }),
      ),
      // Segitiga
      Positioned(
        top: screenSize.height * 0.1555555555555556,
        left: screenSize.width * 0.3697916666666667,
        child: DragTarget<String>(
            onWillAccept: (value) =>
                value == shapeTarget && value == Bentuk.imageUrl[1]
                    ? true
                    : false,
            onAccept: (value) {
              setState(() {
                target = value;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context2) => WinCondition(
                            replay: replay,
                            predicate: (route) {
                              setState(() {
                                target = "";
                              });
                              return route.isFirst;
                            })));
              });
            },
            builder: (context, candidates, rejected) {
              return target == Bentuk.imageUrl[1] && target == shapeTarget
                  ? Image.asset(target,
                      width: screenSize.width * 0.1276041666666667)
                  : Container(
                      width: screenSize.width * 0.1276041666666667,
                      height: screenSize.width * 0.1276041666666667,
                    );
            }),
      ),
      // Trapesium
      Positioned(
        bottom: screenSize.height * 0.3055555555555556,
        left: (screenSize.width * 0.5) - 100,
        child: DragTarget<String>(
            onWillAccept: (value) =>
                value == shapeTarget && value == Bentuk.imageUrl[3]
                    ? true
                    : false,
            onAccept: (value) {
              setState(() {
                target = value;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context2) => WinCondition(
                            replay: replay,
                            predicate: (route) {
                              setState(() {
                                target = "";
                              });
                              return route.isFirst;
                            })));
              });
            },
            builder: (context, candidates, rejected) {
              return target == Bentuk.imageUrl[3] && target == shapeTarget
                  ? Image.asset(target, width: screenSize.width * 0.1276)
                  : Container(
                      width: screenSize.width * 0.1276,
                      height: screenSize.height * 0.27,
                    );
            }),
      ),
      // Lingkaran
      Positioned(
        top: screenSize.height * 0.1555555555555556,
        right: screenSize.width * 0.130208,
        child: DragTarget<String>(
            onWillAccept: (value) =>
                value == shapeTarget && value == Bentuk.imageUrl[4]
                    ? true
                    : false,
            onAccept: (value) {
              setState(() {
                target = value;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context2) => WinCondition(
                            replay: replay,
                            predicate: (route) {
                              setState(() {
                                target = "";
                              });
                              return route.isFirst;
                            })));
              });
            },
            builder: (context, candidates, rejected) {
              return target == Bentuk.imageUrl[4] && target == shapeTarget
                  ? Image.asset(target, width: screenSize.width * 0.0976)
                  : Container(
                      width: screenSize.width * 0.0976,
                      height: screenSize.height * 0.208,
                    );
            }),
      ),
      // Segienam
      Positioned(
        bottom: screenSize.height * 0.278,
        right: screenSize.width * 0.1237,
        child: DragTarget<String>(
            onWillAccept: (value) =>
                value == shapeTarget && value == Bentuk.imageUrl[2]
                    ? true
                    : false,
            onAccept: (value) {
              setState(() {
                target = value;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context2) => WinCondition(
                            replay: replay,
                            predicate: (route) {
                              setState(() {
                                target = "";
                              });
                              return route.isFirst;
                            })));
              });
            },
            builder: (context, candidates, rejected) {
              return target == Bentuk.imageUrl[2] && target == shapeTarget
                  ? Image.asset(target, width: screenSize.width * 0.0976)
                  : Container(
                      width: screenSize.width * 0.0976,
                      height: screenSize.height * 0.208,
                    );
            }),
      ),
    ];
  }
}
