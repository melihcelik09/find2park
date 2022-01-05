import 'package:find2park/service/auth.dart';
import 'package:flutter/material.dart';

class MapUsing extends StatelessWidget {
  MapUsing({Key? key}) : super(key: key);
  AuthService _authService = AuthService();
  var Akdeniz = [
    'Adana',
    'Antalya',
    'Burdur',
    'Hatay',
    'Isparta',
    'Mersin',
    'Kahramanmaraş',
    'Osmaniye',
  ];
  var DoguAnadolu = [
    'Ağrı',
    'Bingöl',
    'Bitlis',
    'Elazığ',
    'Erzincan',
    'Erzurum',
    'Hakkari',
    'Kars',
    'Malatya',
    'Muş',
    'Tunceli',
    'Van',
    'Ardahan',
    'Iğdır',
  ];
  var Ege = [
    'Afyonkarahisar',
    'Aydın',
    'Denizli',
    'İzmir',
    'Kütahya',
    'Manisa',
    'Muğla',
    'Uşak',
  ];
  var GuneyDoguAnadolu = [
    'Adıyaman',
    'Diyarbakır',
    'Gaziantep',
    'Mardin',
    'Siirt',
    'Şanlıurfa',
    'Batman',
    'Şırnak',
    'Kilis',
  ];
  var IcAnadolu = [
    'Ankara',
    'Çankırı',
    'Eskişehir',
    'Kayseri',
    'Kırşehir',
    'Konya',
    'Nevşehir',
    'Niğde',
    'Sivas',
    'Yozgat',
    'Aksaray',
    'Karaman',
    'Kırıkkale',
  ];
  var Karadeniz = [
    'Amasya',
    'Artvin',
    'Bolu',
    'Çorum',
    'Giresun',
    'Gümüşhane',
    'Kastamonu',
    'Ordu',
    'Rize',
    'Samsun',
    'Sinop',
    'Tokat',
    'Trabzon',
    'Zonguldak',
    'Bayburt',
    'Bartın',
    'Karabük',
    'Düzce',
  ];
  var Marmara = [
    'Balıkesir',
    'Bilecik',
    'Bursa',
    'Çanakkale',
    'Edirne',
    'İstanbul',
    'Kırklareli',
    'Kocaeli',
    'Sakarya',
    'Tekirdağ',
    'Yalova',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              indexfind(),
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  _authService.fillMap('İç Anadolu Bölgesi', IcAnadolu);
                },
                child: Text('Doldur'))
          ],
        ),
      ),
    );
  }

  String indexfind() {
    var index = Akdeniz.indexOf('Adana');
    return index.toString();
  }
}
