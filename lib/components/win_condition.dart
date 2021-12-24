import 'package:flutter/material.dart';
import 'package:montesori/components/star.dart';
import 'package:montesori/config/color.dart';
import 'dart:math' as math;

class WinCondition extends StatelessWidget {
  final VoidCallback? replay;
  final RoutePredicate? predicate;
  final int? star;
  WinCondition({Key? key, this.replay, this.predicate, this.star}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String? msg;
    switch (star) {
      case 3:
        msg = "Luar Biasa!";
        break;
      case 2:
        msg = "Kerja Bagus!";
        break;
      case 1:
        msg= "Hebat!";
        break;
      default:
        msg = "Luar Biasa!";
    }
    
    return Scaffold(
        backgroundColor: ColorApps.primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            // * Kotak putih
            Center(
                child: Container(
                    width: 336,
                    height: 147,
                    decoration: BoxDecoration(
                        color: ColorApps.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF000000).withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(4, 4))
                        ]),
                    child: Center(
                      child: Text(msg,
                          style: const TextStyle(
                              color: ColorApps.menuBentuk,
                              fontWeight: FontWeight.w800,
                              fontSize: 24)),
                    ))),
            // * Home button
            Positioned(
              bottom: screenSize.height * 0.14,
              left: screenSize.width * 0.325,
              child: SizedBox(
                width: 89,
                height: 89,
                child: Material(
                    type: MaterialType.circle,
                    color: ColorApps.menuAngka,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).popUntil(predicate!);
                        },
                        icon: const Icon(Icons.home_rounded,
                            color: ColorApps.white, size: 50))),
              ),
            ),
            // * Replay Button
            Positioned(
                bottom: screenSize.height * 0.14,
                right: screenSize.width * 0.323703125,
                child: SizedBox(
                  width: 89,
                  height: 89,
                  child: Material(
                      type: MaterialType.circle,
                      color: ColorApps.menuAngka,
                      child: Transform.rotate(
                          angle: 270 * math.pi / 180,
                          child: IconButton(
                            onPressed: replay,
                            icon: const Icon(Icons.replay_rounded,
                                color: ColorApps.white, size: 50),
                          ))),
                )),
            // * Banner
            Positioned(
              top: screenSize.height * 0.2,
              child: Image.asset("assets/images/menu/ic_menu_win_banner.png",height: 57.75)
            ),
            // * Star
            Positioned(
              top: 80,
              child: SizedBox(
                width: 125,
                child: Star(star:star)
              )
            )
            
          ],
        ));
  }
}
