import 'package:flutter/material.dart';

const _defaultColor = Color(0xff1da2ff);

/// Oratada bulunan yuvarlak buttondur.
/// adı balon butondur çünkü animasyonlu bir şekilde içinden 3 ayrı buton çıkarır
/// ve bu butonların çıkma süreleri birbirinden farklıdır.
/// bu butonlar [solda] [sağda] ve [ortada] bulunur.
/// her birinin tıklanma özelliği mevcuttur. Bu butonlarda animasyon sadece geçişlerde bulunur.
/// ayrıca bu butonlara tıklandıktan sonra kaybolacak şekilde animsayon tersine işler.
class BallonButton extends StatelessWidget {
  const BallonButton({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.items,
    required this.itemOnPress,
    Color? backgroundColor,
  })  : assert(
          items.length != 3,
          'sadece 3 widget koymak zorundasınız',
        ),
        backgroundColor = backgroundColor ?? _defaultColor,
        super(key: key);

  /// Bu widget balon butonun ortasında yer alır
  /// sığacak şekilde widget eklenmesi tavsiye edilir.
  /// tek icon çok güzel bir şekilde görünecektir.
  final Widget icon;

  /// Balon butonuna tıklandıktan sonra tetiklenen metodtur.
  final Function onPress;

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
    return Container();
  }
}
