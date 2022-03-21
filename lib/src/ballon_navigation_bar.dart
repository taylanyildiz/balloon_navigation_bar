import 'dart:io';

import 'package:flutter/material.dart';

import 'ballon_button.dart';

const _backgroundColor = Color(0xff161F35);
const _selectedIconColor = Colors.white;
const _unSelectedIconColor = Color(0xff526187);

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
    required this.items,
    this.onPress,
    Color? backgroundColor,
    Color? selectedIconColor,
    Color? unSelectedIconColor,
    double? elevation,
  })  : backgroundColor = backgroundColor ?? _backgroundColor,
        selectedIconColor = selectedIconColor ?? _selectedIconColor,
        unSelectedIconColor = unSelectedIconColor ?? _unSelectedIconColor,
        elevation = elevation ?? 4.0,
        super(key: key);

  /// Bottom navigaion childs.
  final List<Widget> items;

  /// On press navigation items
  final Function(int value)? onPress;

  /// Arkaplan rengi
  final Color backgroundColor;

  /// Seçili olan iconların rengi
  final Color selectedIconColor;

  /// Seçi olmayan iconların rengi
  final Color unSelectedIconColor;

  /// Gölgelendirme için blur değeri
  final double elevation;

  @override
  State<BallonNavigationBar> createState() => _Ballon();
}

class _Ballon extends State<BallonNavigationBar> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  final GlobalKey _globalKey = GlobalKey();
  late OverlayEntry _entry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInCubic,
    ));

    WidgetsBinding.instance?.scheduleFrameCallback((timeStamp) {
      _createBallonOverlay();
    });
    super.initState();
  }

  ThemeData _theme(BuildContext context) => Theme.of(context);
  BottomNavigationBarThemeData _barThemeData(BuildContext context) =>
      _theme(context).bottomNavigationBarTheme;

  Color get backgroundColor => widget.backgroundColor;
  Color get unSelectedIconColor => widget.unSelectedIconColor;
  Color get selectedIconColor => widget.selectedIconColor;
  double get elevation => widget.elevation;

  bool get isIOS => Platform.isIOS;
  bool get isAndroid => Platform.isAndroid;

  void _createBallonOverlay() {
    _entry = OverlayEntry(builder: _builBallonOverlay);
    Overlay.of(context)?.insert(_entry);
  }

  Widget _builBallonOverlay(BuildContext context) {
    // final renderBoxObj = _globalKey.currentContext?.findRenderObject();
    // RenderBox renderBox = renderBoxObj as RenderBox;
    final size = MediaQuery.of(context).size;
    return Positioned(
      width: 120.0,
      child: CompositedTransformFollower(
        link: _layerLink,
        showWhenUnlinked: false,
        followerAnchor: Alignment.centerRight,
        offset: Offset(size.width / 2 + 60, 40.0),
        child: ReproducibleWidget(
          animation: animation,
          icon: const Icon(Icons.add, color: Colors.white, size: 40),
          itemOnPress: (value) {},
          items: const [],
          onPress: () async {
            await animationController.forward();
            await animationController.reverse();
            print('object');
          },
        ),
      ),
    );
  }

  void _onPress(int value) {
    value = value > 2 ? value-- : value;
    widget.onPress?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        key: _globalKey,
        height: height,
        width: size.width,
        decoration: _boxDecoration,
        child: _child,
      ),
    );
  }

  double get height {
    double navigationHeight = kBottomNavigationBarHeight + 10;
    if (isIOS) navigationHeight = navigationHeight + 10;
    return navigationHeight;
  }

  BoxDecoration get _boxDecoration {
    final theme = _barThemeData(context);
    return BoxDecoration(
      color: theme.backgroundColor ?? backgroundColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: theme.elevation ?? elevation,
        ),
      ],
    );
  }

  Widget get _child {
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index == 2) return const SizedBox(width: 120.0);
          return _navigationItems(index);
        },
      ),
    );
  }

  Widget _navigationItems(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onPress(index),
        child: Container(
          height: double.infinity,
          color: Colors.transparent,
          child: Icon(_icons[index], color: Colors.blue),
        ),
      ),
    );
  }
}

const _icons = [
  Icons.home,
  Icons.search,
  Icons.notifications,
  Icons.notifications,
  Icons.person,
];
