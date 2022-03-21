import 'package:flutter/material.dart';

const _defaultColor = Color(0xff1da2ff);

/// Oratada bulunan yuvarlak buttondur.
/// adı balon butondur çünkü animasyonlu bir şekilde içinden 3 ayrı buton çıkarır
/// ve bu butonların çıkma süreleri birbirinden farklıdır.
/// bu butonlar [solda] [sağda] ve [ortada] bulunur.
/// her birinin tıklanma özelliği mevcuttur. Bu butonlarda animasyon sadece geçişlerde bulunur.
/// ayrıca bu butonlara tıklandıktan sonra kaybolacak şekilde animsayon tersine işler.
class ReproducibleWidget extends AnimatedWidget {
  const ReproducibleWidget({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.items,
    required this.itemOnPress,
    required this.animation,
    Color? backgroundColor,
  })  : assert(
          items.length != 3,
          'sadece 3 widget koymak zorundasınız',
        ),
        backgroundColor = backgroundColor ?? _defaultColor,
        super(key: key, listenable: animation);

  final Animation<double> animation;

  /// Bu widget balon butonun ortasında yer alır
  /// sığacak şekilde widget eklenmesi tavsiye edilir.
  /// tek icon çok güzel bir şekilde görünecektir.
  final Widget icon;

  /// Balon butonuna tıklandıktan sonra tetiklenen metodtur.
  final Function() onPress;

  /// Balon butonuna tıklandıktan sonra çıkacak olan butonlardır.
  /// her birinin genişlik ve yüksekliği eşittir tek widget koymanız tavsiye edilir.
  /// unutmayın 3 widget koyma zorunluluğunuz bulunmaktadır.
  final List<Widget> items;

  /// [items] butnlarına tıklandıktan sonra tetiklenen metodtur.
  /// soldan sağa [0]-[1]-[2] olacak şekilde değer döndürür.
  final Function(int value) itemOnPress;

  /// Balon butonun arkaplan rengini ifade eder
  /// varsayılan olarak Colo(0xff1da2ff) değeri verilmiştir.
  /// Ayrıca bu reng diğer butonlarında arka plan rengini ifade eder.
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          height: 120.0,
          width: 120.0,
          child: CustomPaint(
            painter: _BallonPainter(repaint: animation),
            child: icon,
          ),
        ),
      ),
    );
  }
}

class _BallonPainter extends CustomPainter {
  _BallonPainter({
    required this.repaint,
  }) : super(repaint: repaint);
  final Animation<double> repaint;

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Paint paint = Paint()
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    Paint liquid = Paint()
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    canvas.drawCircle(size.center(Offset.zero), 60.0, paint);
    double radius = -30 * repaint.value;

    Path path = Path();
    path.moveTo(width / 2, 10.0);
    path.quadraticBezierTo(radius, radius, 10.0, height / 2);
    canvas.drawPath(path, liquid);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
