import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/hesap.dart';
import 'package:yasam_beklentisi/user_data.dart';

import 'constants.dart';

class Resultpage extends StatelessWidget {
  final UserData _userData;
  Resultpage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
    backgroundColor: Colors.white70,
    title: Text('Sonuç Sayfası',  style: TextStyle(color: Colors.black54)),
    ) ,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Expanded(
        flex: 8,
        child: Center(child: Text(Hesap(_userData).Hesaplama().round().toString(), style: metinTipi,))),
    Expanded(
        flex: 1,
        child: FlatButton(
          color: Colors.white,
    onPressed: (){
            Navigator.pop(context);
    }, child: Text('GERİ DÖN', style: metinTipi,),
    ))
    ],
    ),
    );
  }
}
