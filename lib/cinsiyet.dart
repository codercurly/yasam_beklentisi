import 'package:flutter/material.dart';
class Cins extends StatelessWidget {
  Color? ikonRengi;
  final IconData? icon;
  String? cinsiyetAdi;
  Cins({this.icon, this.cinsiyetAdi, this.ikonRengi});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 70, color: ikonRengi),
        SizedBox(height: 10),
        Text(
          cinsiyetAdi!,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
