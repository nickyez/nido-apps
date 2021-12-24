// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:montesori/config/color.dart';
import 'package:montesori/config/game_menu.dart';
import 'package:montesori/models/bentuk.dart';
import 'package:montesori/models/huruf.dart';
import 'package:montesori/models/warna.dart';
import 'package:montesori/screens/angka_game/game_angka.dart';
import 'package:montesori/screens/bentuk_game/game_bentuk.dart';
import 'package:montesori/screens/huruf_game/game_huruf.dart';
import 'package:montesori/screens/warna_game/game_warna.dart';

class MenuScreen extends StatefulWidget {
  final GameMenu menu;
  const MenuScreen({Key? key, required this.menu}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late GameMenu menu = widget.menu;
  void selectMenu(GameMenu index) {
    setState(() {
      menu = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorApps.menuHuruf,
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              topNavigation(menu),
              SizedBox(height: 13),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: ColorApps.white),
                  child: IntrinsicHeight(child: content(menu, screenSize)))
            ],
          ),
        ));
  }

  Widget topNavigation(GameMenu menu) {
    String title = "ANGKA";
    List<GameMenu> listMenu = [
      GameMenu.angka,
      GameMenu.bentuk,
      GameMenu.warna,
      GameMenu.huruf
    ];
    switch (menu) {
      case GameMenu.angka:
        title = "ANGKA";
        break;
      case GameMenu.bentuk:
        title = "BENTUK";
        break;
      case GameMenu.huruf:
        title = "HURUF";
        break;
      case GameMenu.warna:
        title = "WARNA";
        break;
      default:
        title = "";
    }
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Material(
          type: MaterialType.circle,
          color: ColorApps.menuAngka,
          child: IconButton(
              color: ColorApps.menuAngka,
              onPressed: () {
                if (menu == GameMenu.angka) {
                  Navigator.pop(context);
                } else {
                  int index = listMenu.indexOf(menu);
                  selectMenu(listMenu[--index]);
                }
              },
              icon: Icon(
                  menu == GameMenu.angka
                      ? Icons.close_rounded
                      : Icons.arrow_back_ios_new_rounded,
                  size: 32,
                  color: ColorApps.white))),
      Text(title,
          style: TextStyle(
              color: ColorApps.white,
              fontSize: 24,
              fontWeight: FontWeight.w800)),
      Material(
          type: MaterialType.circle,
          color: ColorApps.menuAngka,
          child: IconButton(
              onPressed: () {
                if (menu == GameMenu.huruf) {
                  Navigator.pop(context);
                } else {
                  int index = listMenu.indexOf(menu);
                  selectMenu(listMenu[++index]);
                }
              },
              icon: Icon(
                  menu == GameMenu.huruf
                      ? Icons.close_rounded
                      : Icons.arrow_forward_ios_rounded,
                  size: 32,
                  color: ColorApps.white))),
    ]);
  }

  Widget content(GameMenu menu, Size screenSize) {
    String? subTitle, description, imageUrl;
    List<String>? box, boxName;
    Color subTitleColor = Colors.black;
    switch (menu) {
      case GameMenu.angka:
        subTitle = "BERHITUNG BERSAMA TIMUN MAS";
        description =
            "Ayo bantu timun mas melarikan diri dari raksasa hijau jahat dengan berhitung bersama.";
        imageUrl = "assets/images/game_menu_screen/gs_angka.png";
        box = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
        subTitleColor = ColorApps.menuAngka;
        break;
      case GameMenu.bentuk:
        subTitle = "TEBAK BENTUK BERSAMA LUTUNG KASARUNG";
        description =
            "Ayo bantu Lutung Kasarung memasukkan bentuk ke dalam lubang yang tepat.";
        imageUrl = "assets/images/game_menu_screen/gs_bentuk.png";
        box = Bentuk.shape;
        boxName = Bentuk.name;
        subTitleColor = ColorApps.menuBentuk;
        break;
      case GameMenu.huruf:
        subTitle = "BELAJAR MEMBACA BERSAMA KEONG MAS";
        description =
            "Bantu keong mas dalam mengeja huruf dan membaca objek yang ada di gambar.";
        imageUrl = "assets/images/game_menu_screen/gs_huruf.jpg";
        box = Huruf.title;
        subTitleColor = ColorApps.menuHuruf;
        break;
      case GameMenu.warna:
        subTitle = "TEBAK WARNA BERSAMA MALIN KUNDANG";
        description = "Ayo bantu Malin Kundang menangkap berbagai macam ikan.";
        imageUrl = "assets/images/game_menu_screen/gs_warna.png";
        box = Warna.imageUrl;
        boxName = Warna.name;
        subTitleColor = ColorApps.menuWarna;
        break;
      default:
        subTitle = "";
        description = "";
        box = [];
    }
    return Row(children: [
      Flexible(
        flex: 30,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(imageUrl!, fit: BoxFit.cover))),
      ),
      Expanded(child: SizedBox()), // Untuk memberikan jarak saja
      Flexible(
          flex: 69,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: subTitleColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(children: [
                      Text(subTitle,
                          style: TextStyle(
                              color: ColorApps.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w800))
                    ])),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: ColorApps.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Container(
                    width: screenSize.width * 0.62,
                    height: 120,
                    alignment: Alignment.center,
                    child: ListView.separated(
                        padding: EdgeInsets.only(right: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: box.length,
                        separatorBuilder: (ctx, index) => SizedBox(width: 30),
                        itemBuilder: (ctx, index) {
                          return Stack(
                              alignment: Alignment.bottomCenter,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: ColorApps.menuBentuk,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                        child: menu == GameMenu.warna ||
                                                menu == GameMenu.bentuk
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(box![index],
                                                    height: 60, width: 60),
                                              )
                                            : Text(box![index],
                                                style: TextStyle(
                                                    color: ColorApps.white,
                                                    fontSize: 52,
                                                    fontWeight:
                                                        FontWeight.w800)))),
                                Positioned(
                                    top: 0,
                                    right: -20,
                                    child: Material(
                                        type: MaterialType.circle,
                                        color: ColorApps.menuAngka,
                                        child: IconButton(
                                            onPressed: () {
                                              switch (menu) {
                                                case GameMenu.angka:
                                                  Navigator.push(
                                                      ctx,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context2) =>
                                                              GameAngka(
                                                                  angka: box![
                                                                      index])));
                                                  break;
                                                case GameMenu.bentuk:
                                                  Navigator.push(
                                                      ctx,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context2) =>
                                                              GameBentuk(
                                                                  name: boxName![
                                                                      index],
                                                                  shapeTarget: Bentuk
                                                                          .shape2[
                                                                      index])));
                                                  break;
                                                case GameMenu.warna:
                                                  Navigator.push(
                                                      ctx,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context2) =>
                                                              GameWarna(
                                                                  name: boxName![
                                                                      index],
                                                                  target: box![
                                                                      index])));
                                                  break;
                                                case GameMenu.huruf:
                                                  Navigator.push(
                                                      ctx,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context2) =>
                                                              GameHuruf(
                                                                  index:
                                                                      index)));
                                                  break;
                                              }
                                            },
                                            icon: const Icon(
                                                Icons.play_arrow_outlined,
                                                size: 28,
                                                color: ColorApps.white))))
                              ]);
                        }))
              ]))
    ]);
  }
}
