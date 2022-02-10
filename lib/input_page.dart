import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/user_data.dart';
import 'cinsiyet.dart';
import 'kutucuk.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 15;
  double sporSayisi = 3;
  int boy = 170;
  int kilo = 60;
  String? seciliButon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Kutucuk(
                child: buildRow('BOY'),
              )),
              Expanded(
                  child: Kutucuk(
                child: buildRow('KİLO'),
              ))
            ],
          )),
          Expanded(
              child: Kutucuk(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Günde kaç sigara içiyorsunuz?',
                  style: metinTipi,
                ),
                SizedBox(height: 10.0),
                Text(icilenSigara.round().toString(), style: sayiTipi),
                Slider(
                  min: 0,
                  max: 30,
                  value: icilenSigara,
                  onChanged: (double newValue) {
                    setState(() {
                      icilenSigara = newValue;
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: Kutucuk(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Haftada kaç gün spor yapıyorsunuz?',
                  style: metinTipi,
                ),
                SizedBox(height: 7.0),
                Text(
                  sporSayisi.round().toString(),
                  style: sayiTipi,
                ),
                Slider(
                  min: 0,
                  max: 7,
                  divisions: 7,
                  value: sporSayisi,
                  onChanged: (double newValue) {
                    setState(() {
                      sporSayisi = newValue;
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Kutucuk(
                onPress: () {
                  setState(() {
                    seciliCinsiyet = 'kadin';
                  });
                },
                renk: seciliCinsiyet == 'kadin' ? Colors.white54 : Colors.white,
                child: Cins(
                  icon: Icons.female,
                  cinsiyetAdi: 'KADIN',
                  ikonRengi: Colors.pinkAccent,
                ),
              )),
              Expanded(
                  child: Kutucuk(
                onPress: () {
                  setState(() {
                    seciliCinsiyet = 'erkek';
                  });
                },
                renk: seciliCinsiyet == 'erkek' ? Colors.white54 : Colors.white,
                child: Cins(
                  icon: Icons.male,
                  cinsiyetAdi: 'ERKEK',
                  ikonRengi: Colors.lightBlueAccent,
                ),
              )),
            ],
          )),
          Container(
            child: ButtonTheme(
              height: 50,
              child: MaterialButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Resultpage(UserData(
                              seciliCinsiyet: seciliCinsiyet,
                              icilenSigara: icilenSigara,
                              boy: boy,
                              kilo: kilo,
                              sporSayisi: sporSayisi))));
                },
                child: Text(
                  'HESAPLA',
                  style: metinTipi,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRow(String adlar) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              adlar,
              style: metinTipi,
            )),
        SizedBox(
          width: 9,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              adlar == 'BOY' ? boy.toString() : kilo.toString(),
              style: sayiTipi,
            )),
        SizedBox(
          width: 9,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 15,
                ),
                highlightColor: Colors.teal,
                onPressed: () {
                  setState(() {
                    adlar == 'BOY' ? boy++ : kilo++;
                  });
                },
              ),
            ),
            ButtonTheme(
                minWidth: 36,
                child: OutlineButton(
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                    child: Icon(
                      FontAwesomeIcons.minus,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        adlar == 'BOY' ? boy-- : kilo--;
                      });
                    }))
          ],
        )
      ],
    );
  }
}
