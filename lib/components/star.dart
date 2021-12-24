import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final int? star;
  const Star({Key? key, this.star}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _opacity3 = 0.4, _opacity2 = 0.4, _opacity1 = 0.4;
    switch (star) {
      case 3:
        _opacity3 = 1;
        _opacity2 = 1;
        _opacity1 = 1;
        break;
      case 2:
        _opacity2 = 1;
        _opacity1 = 1;
        break;
      case 1:
        _opacity1 = 1;
        break;
      default:
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
            opacity: _opacity1,
            child: Image.asset("assets/images/menu/ic_menu_win_star.png",
                width: 35)),
        Opacity(
            opacity: _opacity2,
            child: Image.asset("assets/images/menu/ic_menu_win_star.png",
                width: 35)),
        Opacity(
            opacity: _opacity3,
            child: Image.asset("assets/images/menu/ic_menu_win_star.png",
                width: 35))
      ],
    );
  }
}
