import 'package:flutter/material.dart';
import 'package:montesori/config/color.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/menu/ic_menu_background.png'),
            fit: BoxFit.fill
          )
        ),
        child: Stack(
          children: [
            
            // Bottom Navbar
            Positioned(
              bottom:0,
              child: Container(
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: ColorApps.white,
                  borderRadius: const BorderRadius.vertical(top:Radius.circular(8))
                ),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    bottomMenu(
                      ColorApps.menuAngka, 
                      Image.asset('assets/images/menu/ic_menu_angka.png',width:48,height:90), 
                      "ANGKA"),
                    bottomMenu(
                      ColorApps.menuBentuk, 
                      Image.asset('assets/images/menu/ic_menu_bentuk.png',width:69,height:90), 
                      "BENTUK"),
                    bottomMenu(
                      ColorApps.menuWarna, 
                      Image.asset('assets/images/menu/ic_menu_warna.png',width:72,height:90), 
                      "WARNA"),
                    bottomMenu(
                      ColorApps.menuHuruf, 
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child:Image.asset('assets/images/menu/ic_menu_huruf.png',width:69,height:47)
                      ), 
                      "HURUF"),
                  ]
                )
              )
            )
          ],
        )
      ),
    );
  }

  Widget bottomMenu(Color col, Widget img, String title){
    return GestureDetector(
      onTap:(){},
      child: Stack(
        overflow: Overflow.visible,
        children:[
          Container(
            height: 58,
            width: 126,
            decoration: BoxDecoration(
              color: col,
              borderRadius: const BorderRadius.all(Radius.circular(8))
            )
          ),
          Positioned(
            bottom:0,
            right:0,
            child: img
          ),
          Positioned(
            left : 15,
            top : 15,
            child : Text(
              title, 
              style: const TextStyle(
                color: ColorApps.white,
                fontSize: 16,
                fontWeight: FontWeight.w800
              )
            )
          )
        ]
      ),
    );
  }
}
// enum menuBar {ANGKA,BENTUK,WARNA,HURUF}