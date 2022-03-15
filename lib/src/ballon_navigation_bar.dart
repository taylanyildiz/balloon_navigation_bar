import 'package:flutter/material.dart';

const _defaultBackgroundColor = Color(0xff161F35);
const _defaultSelectedIconTheme = IconThemeData(
  color: Colors.white,
  size: 25.0,
);
const _defaultUnSelectedIconTheme = IconThemeData(
  color: Color(0xff526187),
  size: 25.0,
);

/// Balon butonu bulunduran ve bununla beraber 4 widget ile beraber bir navigation bardır.
/// Balon buton animasyon içerir ve özelleştirilmesine izin verilir
/// Fluuter'in sunduğu [BottomNavigationBarThemeData] Temayı destekler sadece bir kaç farklılık bulundurmaktadır.
/// Sadece iconlar için geçerlidir.
/// örneğin :
/*

 [BottomNavigationBarThemeData]: 
[backgroundColor]:      # Bottom barın arklaplan rengi
[selectedItemColor]:    # Balon buton ve itemlarının önplan rengi
[unselectedItemColor]:  # Balon butonun ve itemlarının arkaplan rengi
[selectedIconTheme]:    # diğer 4 widgetin iconThemeDatası
[unselectedIconTheme]:  # diğer 4 widgetin iconThemeDatası

*/
/// Tema örneğini anlamadıysanız [örnek]() koda bakabilirsiniz
class BallonNavigationBar extends StatefulWidget {
  const BallonNavigationBar({
    Key? key,
  }) : super(key: key);

  ///
  final List<Widget> items;

  ///
  final Color backgroundColor;

  ///
  final Color selectedIconColor;

  ///
  final Color unSelectedIconColor;

  ///
  final double evelation;

  @override
  State<BallonNavigationBar> createState() => _BallonNavigationBarState();
}

class _BallonNavigationBarState extends State<BallonNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  ThemeData _theme(BuildContext context) => Theme.of(context);
  BottomNavigationBarThemeData _barThemeData(BuildContext context) =>
      _theme(context).bottomNavigationBarTheme;

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
    return const BoxDecoration(
      color: Colors.red,
    );
  }

  Widget get _child {
    return Row(
      children: [],
    );
  }
}
