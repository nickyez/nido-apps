import 'package:flutter/material.dart';
import 'package:montesori/config/color.dart';
import 'package:montesori/config/game_menu.dart';
import 'dart:math' as math;

import 'package:montesori/screens/menuscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentValue = 20;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/menu/ic_menu_background.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // * banner logo (yellow)
                const Positioned(
                    top: 0,
                    left: 14,
                    child: Icon(Icons.turned_in_sharp,
                        color: ColorApps.menuBentuk, size: 98.5)),
                // * logo
                Positioned(
                    top: 28,
                    left: 43,
                    child: Image.asset("assets/images/menu/ic_menu_logo.png",
                        width: 41)),
                // * image LetsPlay
                Positioned(
                  top: 28,
                  child: Image.asset("assets/images/menu/ic_menu_play.png",
                      height: 121),
                ),
                // * Setting
                Positioned(
                    top: 20,
                    right: 20,
                    child: Material(
                        type: MaterialType.circle,
                        color: ColorApps.menuAngka,
                        child: IconButton(
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    double _currentValue = 20;
                                    return SingleChildScrollView(
                                      child: AlertDialog(
                                          title: SizedBox(
                                            width: 336,
                                            height: 44,
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  const Positioned(
                                                      top: 8,
                                                      child: Text("SETTINGS",
                                                          style: TextStyle(
                                                            color: ColorApps
                                                                .titleSet,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                          textAlign: TextAlign
                                                              .center)),
                                                  Positioned(
                                                      top: 0,
                                                      right: 12,
                                                      child: SizedBox(
                                                        width: 40,
                                                        child: Material(
                                                            type: MaterialType
                                                                .circle,
                                                            color: ColorApps
                                                                .menuAngka,
                                                            child: IconButton(
                                                                color: ColorApps
                                                                    .menuAngka,
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      ctx);
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .close_rounded,
                                                                    size: 24,
                                                                    color: ColorApps
                                                                        .white))),
                                                      ))
                                                ]),
                                          ),
                                          content: StatefulBuilder(
                                            builder: (context, setState) {
                                              return Column(children: [
                                                    Container(
                                                        height: 155,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                border:
                                                                    Border.all(
                                                                  color: ColorApps
                                                                      .menuAngka,
                                                                  width: 2,
                                                                )),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            // ! Subtitle
                                                            Column(
                                                                children: const [
                                                                  Center(
                                                                      child:
                                                                          Text(
                                                                    "Id card",
                                                                    style:
                                                                        TextStyle(
                                                                      color: ColorApps
                                                                          .menuAngka,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                    ),
                                                                  )),
                                                                  Divider(
                                                                      thickness:
                                                                          2,
                                                                      color: ColorApps
                                                                          .menuAngka)
                                                                ]),
                                                            // ! Nama
                                                            Row(children: [
                                                              const Expanded(
                                                                  child: Text(
                                                                "Nama",
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorApps
                                                                      .menuAngka,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                              )),
                                                              Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 1,
                                                                    horizontal:
                                                                        8),
                                                                decoration: BoxDecoration(
                                                                    color: ColorApps
                                                                        .menuBentuk,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50)),
                                                                width: 180,
                                                                height: 20,
                                                                child: const TextField(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: ColorApps
                                                                            .titleSet,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500),
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            "")),
                                                              )
                                                            ]),
                                                            // ! Umur
                                                            Row(children: [
                                                              const Expanded(
                                                                  child: Text(
                                                                "Umur",
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorApps
                                                                      .menuAngka,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                              )),
                                                              Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 1,
                                                                    horizontal:
                                                                        8),
                                                                decoration: BoxDecoration(
                                                                    color: ColorApps
                                                                        .menuBentuk,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50)),
                                                                width: 180,
                                                                height: 20,
                                                                child: const TextField(
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: ColorApps
                                                                            .titleSet,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500),
                                                                    decoration: InputDecoration.collapsed(
                                                                        hintText:
                                                                            "")),
                                                              )
                                                            ]),
                                                            // ! Music
                                                            Row(children: [
                                                              const Expanded(
                                                                  child: Text(
                                                                "Music",
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorApps
                                                                      .menuAngka,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                              )),
                                                              Align(
                                                                alignment: Alignment.centerRight,
                                                                child: SizedBox(
                                                                  width: 180,
                                                                  height: 20,
                                                                  child:
                                                                      SliderTheme(
                                                                    data:
                                                                        SliderThemeData(
                                                                      trackHeight:
                                                                          20,
                                                                      activeTrackColor:
                                                                          ColorApps
                                                                              .menuBentuk,
                                                                      inactiveTrackColor: ColorApps
                                                                          .menuBentuk
                                                                          .withOpacity(
                                                                              0.3),
                                                                      thumbColor:
                                                                          ColorApps
                                                                              .menuAngka,
                                                                      overlayShape:
                                                                          RoundSliderOverlayShape(
                                                                              overlayRadius:
                                                                                  0.0),
                                                                      thumbShape: RoundSliderThumbShape(
                                                                          enabledThumbRadius:
                                                                              15),
                                                                    ),
                                                                    child: Slider(
                                                                        min: 0,
                                                                        max: 100,
                                                                        value:
                                                                            _currentValue,
                                                                        onChanged: (value) =>
                                                                            setState(
                                                                                () {
                                                                              _currentValue =
                                                                                  value;
                                                                            })),
                                                                  ),
                                                                ),
                                                              )
                                                            ]),
                                                          ],
                                                        )),
                                                    const SizedBox(height: 15),
                                                    Container(
                                                        height: 35,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                border:
                                                                    Border.all(
                                                                  color: ColorApps
                                                                      .menuBentuk,
                                                                  width: 2,
                                                                )),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: const [
                                                              Text(
                                                                  "Video Tutorial",
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorApps
                                                                        .menuBentuk,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center)
                                                            ]))
                                                  ]);
                                            },
                                          )),
                                    );
                                  });
                            },
                            icon: const Icon(Icons.settings,
                                color: ColorApps.white, size: 32)))),
                // * Bottom Navbar
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: screenSize.width,
                        decoration: const BoxDecoration(
                            color: ColorApps.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(8))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              bottomMenu(
                                  ColorApps.menuAngka,
                                  Image.asset(
                                      'assets/images/menu/ic_menu_angka.png',
                                      width: 48,
                                      height: 90),
                                  "ANGKA", () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MenuScreen(
                                                menu: GameMenu.angka)));
                              }),
                              bottomMenu(
                                  ColorApps.menuBentuk,
                                  Image.asset(
                                      'assets/images/menu/ic_menu_bentuk.png',
                                      width: 69,
                                      height: 90),
                                  "BENTUK", () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MenuScreen(
                                                menu: GameMenu.bentuk)));
                              }),
                              bottomMenu(
                                  ColorApps.menuWarna,
                                  Image.asset(
                                      'assets/images/menu/ic_menu_warna.png',
                                      width: 72,
                                      height: 90),
                                  "WARNA", () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MenuScreen(
                                                menu: GameMenu.warna)));
                              }),
                              bottomMenu(
                                  ColorApps.menuHuruf,
                                  Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: Image.asset(
                                          'assets/images/menu/ic_menu_huruf.png',
                                          width: 69,
                                          height: 47)),
                                  "HURUF", () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const MenuScreen(
                                                menu: GameMenu.huruf)));
                              }),
                            ])))
              ],
            )),
      ),
    );
  }

  Widget bottomMenu(Color col, Widget img, String title, void Function()? nav) {
    return GestureDetector(
      onTap: nav,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
            height: 58,
            width: 126,
            decoration: BoxDecoration(
                color: col,
                borderRadius: const BorderRadius.all(Radius.circular(8)))),
        Positioned(bottom: 0, right: 0, child: img),
        Positioned(
            left: 15,
            top: 17,
            child: Text(title,
                style: const TextStyle(
                    fontFamily: "Rounded Mplus 1c",
                    color: ColorApps.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800)))
      ]),
    );
  }
}
// enum menuBar {ANGKA,BENTUK,WARNA,HURUF}