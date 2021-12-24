import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:montesori/components/exit_button.dart';
import 'package:montesori/components/star.dart';
import 'package:montesori/components/win_condition.dart';
import 'package:montesori/config/color.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class GameAngka extends StatefulWidget {
  final String angka;
  const GameAngka({Key? key, required this.angka}) : super(key: key);

  @override
  _GameAngkaState createState() => _GameAngkaState();
}

class _GameAngkaState extends State<GameAngka> {
  late String angka = widget.angka;
  @override
  void initState() {
    super.initState();
    moveCharacter();
  }

  Duration animateDuration = const Duration(milliseconds: 600);
  double butoPosition = 61;
  double timunemasPosition = 25;
  double botBiji = 40;
  double sizeBiji = 103;
  bool isAttack = false;
  bool hurt = false;
  int attacked = 0;

  moveCharacter() async {
    var duration = const Duration(milliseconds: 500);
    return Timer(duration, () {
      setState(() {
        animateDuration = const Duration(milliseconds: 600);
        butoPosition = 23;
        timunemasPosition = -46;
      });
    });
  }

  void refresh() {
    setState(() {
      animateDuration = const Duration(milliseconds: 0);
      butoPosition = 61;
      timunemasPosition = 25;
      isAttack = false;
      attacked = 0;
    });
    moveCharacter();
    Navigator.pop(context);
  }

  animateHurt() async {
    var duration = const Duration(milliseconds: 500);
    return Timer(duration, () {
      setState(() {
        hurt = false;
        botBiji = 40;
        sizeBiji = 103;
      });
    });
  }

  winCondition() async {
    var duration = const Duration(milliseconds: 800);
    return Timer(duration, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context2) => WinCondition(
                  replay: refresh,
                  predicate: (route) => route.isFirst,
                  star: int.parse(angka) <= 3
                      ? 1
                      : int.parse(angka) >= 4 && int.parse(angka) <= 6
                          ? 2
                          : 3)));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              if (butoPosition == 23) {
                setState(() {
                  isAttack = true;
                });
              }
            },
            child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/angka/bg_angka.png'),
                        fit: BoxFit.fill)),
                child: Stack(alignment: Alignment.center, children: [
                  // * Buto
                  AnimatedPositioned(
                    bottom: butoPosition,
                    duration: animateDuration,
                    child: !hurt
                        ? Image.asset("assets/images/angka/ic_angka_buto.png",
                            height: 263)
                        : Image.asset(
                            "assets/images/angka/ic_angka_buto_hurt.png",
                            height: 263),
                  ),
                  // * Timun emas
                  !isAttack
                      ? AnimatedPositioned(
                          bottom: timunemasPosition,
                          duration: animateDuration,
                          child: Image.asset(
                              "assets/images/angka/ic_angka_timunemas.png",
                              height: 186),
                        )
                      : const SizedBox(),
                  // * Indikator jumlah biji yang dilempar
                  isAttack
                      ? Positioned(
                          left: 0,
                          bottom: 32,
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 36, 5),
                              decoration: const BoxDecoration(
                                  color: ColorApps.white,
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(50))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Jumlah: ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  Text("$attacked",
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800,
                                          color: ColorApps.menuBentuk))
                                ],
                              )))
                      : const SizedBox(),
                  // * Biji
                  isAttack
                      ? AnimatedPositioned(
                          duration: Duration(milliseconds: 200),
                          bottom: botBiji,
                          left: screenSize.width * 0.5,
                          child: SwipeDetector(
                            onSwipeUp: () {
                              setState(() {
                                if (attacked == int.parse(angka) - 1) {
                                  winCondition();
                                }
                                attacked++;
                                hurt = true;
                                botBiji = screenSize.height * 0.68;
                                sizeBiji = 50;
                              });
                              animateHurt();
                            },
                            child: Image.asset(
                                "assets/images/angka/ic_angka_biji.png",
                                width: sizeBiji),
                          ))
                      : const SizedBox(),
                  // * Bubble Text
                  timunemasPosition == -46 && !isAttack
                      ? Positioned(
                          bottom: 100,
                          right: screenSize.width * 0.55,
                          child: SizedBox(
                            width: 250,
                            height: 42,
                            child: Bubble(
                              nip: BubbleNip.rightBottom,
                              color: ColorApps.menuWarna,
                              child: Center(
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text:
                                            "Bantu Timun Mas mengalahkan Buto Ijo Jahat dengan melempar",
                                        style: TextStyle(
                                            fontFamily: "Rounded Mplus 1c",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800,
                                            color: ColorApps.white),
                                        children: [
                                          TextSpan(
                                              text: " $angka",
                                              style: TextStyle(
                                                  color: ColorApps.menuBentuk)),
                                          TextSpan(text: " biji-bijian")
                                        ])),
                              ),
                            ),
                          ))
                      : const SizedBox(),
                  // * Star
                  const Positioned(
                      top: 20,
                      left: 13,
                      child: SizedBox(
                          width: 125,
                          child: Star(
                              star: 0))),
                  // * Setting button
                  Positioned(
                      top: 20,
                      right: 20,
                      child: ExitButton(
                          replay: refresh, predicate: (route) => route.isFirst))
                ]))));
  }
}
