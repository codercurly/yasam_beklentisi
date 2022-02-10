import 'package:yasam_beklentisi/user_data.dart';

class Hesap{
   UserData _userData;
   Hesap(this._userData);

  double Hesaplama(){

    double sonuc;
     sonuc=90 + _userData.sporSayisi - _userData.icilenSigara;

     sonuc= sonuc +(_userData.boy/_userData.kilo);

     _userData=="kadin"?
          sonuc+3:
      sonuc;
    return(sonuc);
 }

}