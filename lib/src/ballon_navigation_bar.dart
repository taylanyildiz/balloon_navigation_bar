import 'package:flutter/material.dart';

/// Balon butonu bulunduran ve bununla beraber 4 widget ile beraber bir navigation bardır.
/// Balon buton animasyon içerir ve özelleştirilmesine izin verilir
/// Fluuter'in sunduğu [BottomNavigationBarThemeData] Temayı destekler sadece bir kaç farklılık bulundurmaktadır.
/// örneğin
///
/*

     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff161F35),             # Bottom barın arklaplan rengi
          selectedItemColor: Colors.white,                # Balon buton ve itemlarının önplan rengi
          unselectedItemColor: Color(0xff1da2ff),         # Balon butonun ve itemlarının arkaplan rengi
          selectedIconTheme: IconThemeData(               # diğer 4 widgetin iconThemeDatası
            color: Colors.white,
            size: 25.0,
          ),
          unselectedIconTheme: IconThemeData(             # diğer 4 widgetin iconThemeDatası
            color: Color(0xff526187),
            size: 25.0,
          ),
        ),

*/
/// Tema örneğini anlamadıysanız [örnek]() koda bakabilirsiniz
class BallonNavigationBar extends StatefulWidget {
  const BallonNavigationBar({Key? key}) : super(key: key);

  @override
  State<BallonNavigationBar> createState() => _BallonNavigationBarState();
}

class _BallonNavigationBarState extends State<BallonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: kBottomNavigationBarHeight,
      width: size.width,
      decoration: _boxDecoration,
      child: _child,
    );
  }

  BoxDecoration get _boxDecoration {
    return const BoxDecoration(color: Colors.red);
  }

  Widget get _child {
    return Row(
      children: [],
    );
  }
}
