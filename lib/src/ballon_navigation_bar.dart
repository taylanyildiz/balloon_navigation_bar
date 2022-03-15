import 'package:flutter/material.dart';

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
