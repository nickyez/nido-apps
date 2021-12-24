import 'dart:math' as math;
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:montesori/components/exit_button.dart';
import 'package:montesori/components/star.dart';
import 'package:montesori/components/win_condition.dart';
import 'package:montesori/config/color.dart';
import 'package:montesori/models/warna.dart';

class GameWarna extends StatefulWidget {
  final String name;
  final String target;
  const GameWarna({Key? key, required this.name, required this.target})
      : super(key: key);

  @override
  _GameWarnaState createState() => _GameWarnaState();
}

class _GameWarnaState extends State<GameWarna> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    late String name = widget.name, target = widget.target;
    var isAccept = false;
    var wrongCount = 0;
    var image = "";

    // ? Untuk reset value
    void reset() {
      setState(() {
        wrongCount = 0;
        isAccept = false;
      });
    }

    
    // ! Untuk tombol replay pada setting button
    void replay() {
      reset();
      Navigator.pop(context);
    }

    // * Untuk shuffle ikan
    List<int> _in = [0, 1, 2, 3, 4, 5];
    List<int> _inShuffle = _in..shuffle();

    return Scaffold(
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/game_menu_screen/gs_warna.png'),
                    fit: BoxFit.fill)),
            child: Stack(children: [
              // * Target
              Positioned(
                top: screenSize.height * 0.1944444444444444,
                right: screenSize.width * 0.3450520833333333,
                child: DragTarget<String>(
                  onWillAccept: (value) {
                    if (value != target) {
                      wrongCount++;
                      return false;
                    }
                    return true;
                  },
                  onAccept: (value) {
                    isAccept = true;
                    image = value;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context2) => WinCondition(
                                replay: replay,
                                predicate: (route) {
                                  reset();
                                  return route.isFirst;
                                },
                                star: wrongCount >= 2
                                    ? 1
                                    : wrongCount == 1
                                        ? 2
                                        : 3)));
                  },
                  builder: (context, candidates, rejected) {
                    return isAccept
                        ? Image.asset(image, height: 45)
                        : Container(
                            width: 58,
                            height: 58,
                          );
                  },
                ),
              ),
              // * Bubble Text
              Positioned(
                  top: screenSize.height * 0.0888888888888889,
                  right: screenSize.width * 0.42,
                  child: SizedBox(
                      width: 213,
                      height: 42,
                      child: Bubble(
                          nip: BubbleNip.rightBottom,
                          color: ColorApps.menuWarna,
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      "Bantu Malin Kundang memasukkan ikan berwarna ",
                                  children: [
                                    TextSpan(
                                        text: name,
                                        style: const TextStyle(
                                            color: ColorApps.menuBentuk))
                                  ],
                                  style: const TextStyle(
                                      fontFamily: "Rounded Mplus 1c",
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10,
                                      color: ColorApps.white)),
                            ),
                          )))),
              // * Ikan
              for (var i = 0; i < Warna.imageUrl.length; i++)
                Positioned(
                    top: (screenSize.height * 0.5) + math.Random().nextInt(100),
                    right: 50 + (i * 120),
                    child: Draggable<String>(
                        data: Warna.imageUrl[_inShuffle[i]],
                        child: Image.asset(Warna.imageUrl[_inShuffle[i]],
                            height: 58),
                        childWhenDragging: SizedBox(),
                        feedback: Image.asset(Warna.imageUrl[_inShuffle[i]],
                            height: 58))),
              // * Star
              Positioned(
                  top: 20,
                  left: 13,
                  child: SizedBox(
                      width: 125,
                      child: Star(
                          star: wrongCount >= 2
                              ? 1
                              : wrongCount == 1
                                  ? 2
                                  : 3))),
              // * Setting Button
              Positioned(
                  top: 20,
                  right: 20,
                  child: ExitButton(
                      replay: replay,
                      predicate: (route) {
                        setState(() {
                          isAccept = false;
                        });
                        return route.isFirst;
                      }))
            ])));
  }
}
