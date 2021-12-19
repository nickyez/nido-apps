import 'package:flutter/material.dart';
import 'package:montesori/config/color.dart';
import 'dart:math' as math;

class ExitButton extends StatelessWidget {
  ExitButton({Key? key, this.replay, this.predicate}) : super(key: key);
  final VoidCallback? replay;
  final RoutePredicate? predicate;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      child: Material(
          type: MaterialType.circle,
          color: ColorApps.menuAngka,
          child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        AlertDialog(
                          title: SizedBox(height: 10),
                          content: const Text("Apakah kamu yakin ingin keluar?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          actionsAlignment: MainAxisAlignment.spaceAround,
                          actions: [
                            Material(
                                type: MaterialType.circle,
                                color: ColorApps.menuAngka,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .popUntil(predicate!);
                                    },
                                    icon: const Icon(Icons.home_rounded,
                                        color: ColorApps.white))),
                            Material(
                                type: MaterialType.circle,
                                color: ColorApps.menuAngka,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.play_arrow_outlined,
                                        color: ColorApps.white))),
                            Material(
                                type: MaterialType.circle,
                                color: ColorApps.menuAngka,
                                child: Transform.rotate(
                                    angle: 270 * math.pi / 180,
                                    child: IconButton(
                                      onPressed: replay,
                                      icon: Icon(Icons.replay_rounded,
                                          color: ColorApps.white),
                                    ))),
                          ],
                        ),
                        Positioned(
                            top: screenSize.height * 0.2,
                            child: Image.asset(
                                "assets/images/menu/ic_menu_pause.png",
                                height: 57.25,
                                width: 250))
                      ],
                    );
                  });
            },
            icon: Icon(Icons.logout, size: 32, color: ColorApps.white),
          )),
    );
  }
}
