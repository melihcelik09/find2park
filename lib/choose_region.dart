import 'dart:convert';
import 'dart:math';

import 'package:find2park/service/auth.dart';
import 'package:flutter/material.dart';

class ChooseRegion extends StatefulWidget {
  ChooseRegion({Key? key}) : super(key: key);

  @override
  State<ChooseRegion> createState() => _ChooseRegionState();
}

class _ChooseRegionState extends State<ChooseRegion> {
  AuthService _authService = AuthService();
  var regions = [
    'Akdeniz Bölgesi',
    'Doğu Anadolu Bölgesi',
    'Ege Bölgesi',
    'Güneydoğu Anadolu Bölgesi',
    'İç Anadolu Bölgesi',
    'Karadeniz Bölgesi',
    'Marmara Bölgesi',
  ];
  Map<String, dynamic> location = {
    "Akdeniz Bölgesi": [
      'Adana',
      'Antalya',
      'Burdur',
      'Hatay',
      'Isparta',
      'Mersin',
      'Kahramanmaraş',
      'Osmaniye',
    ],
    "Doğu Anadolu Bölgesi": [
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
    ],
    'Ege Bölgesi': [
      'Afyonkarahisar',
      'Aydın',
      'Denizli',
      'İzmir',
      'Kütahya',
      'Manisa',
      'Muğla',
      'Uşak',
    ],
    'Güneydoğu Anadolu Bölgesi': [
      'Adıyaman',
      'Diyarbakır',
      'Gaziantep',
      'Mardin',
      'Siirt',
      'Şanlıurfa',
      'Batman',
      'Şırnak',
      'Kilis',
    ],
    'İç Anadolu Bölgesi': [
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
    ],
    'Karadeniz Bölgesi': [
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
    ],
    'Marmara Bölgesi': [
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
    ],
  };
// location[selectedRegion].toString()
//map user ana database mapin icinde bolgeler iller ve ilceleri
//mape illeri at
  List parkingList = [
    {
      'image': 'https://picsum.photos/id/15/200/300',
      'name': 'Otopark 1',
      'occupancy': {
        'free': (Random().nextInt(20) + 1),
        'total': 20,
      },
      "address": '',
      'status': 'Opened',
      'isPaid': false,
      'type': 'OnStreet',
      'openingHours': {
        {
          "tuesday": "07:00 – 22:00",
          "wednesday": "07:00 – 22:00",
          "saturday": "07:00 – 22:00",
          "monday": "07:00 – 22:00",
          "sunday": "07:00 – 22:00",
          "friday": "07:00 – 22:00",
          "thursday": "07:00 – 22:00"
        }
      },
    },
    {
      'image': 'https://picsum.photos/id/15/200/300',
      'name': 'Otopark 2',
      'occupancy': {
        'free': (Random().nextInt(20) + 1),
        'total': 20,
      },
      "address": '',
      'status': 'Opened',
      'isPaid': true,
      'type': 'OnStreet',
      'openingHours': {
        {
          "tuesday": "07:00 – 22:00",
          "wednesday": "07:00 – 22:00",
          "saturday": "07:00 – 22:00",
          "monday": "07:00 – 22:00",
          "sunday": "07:00 – 22:00",
          "friday": "07:00 – 22:00",
          "thursday": "07:00 – 22:00"
        }
      },
    },
    {
      'image': 'https://picsum.photos/id/15/200/300',
      'name': 'Otopark 3',
      'occupancy': {
        'free': (Random().nextInt(20) + 1),
        'total': 20,
      },
      "address": '',
      'status': 'Opened',
      'isPaid': false,
      'type': 'OnStreet',
      'openingHours': {
        {
          "tuesday": "07:00 – 22:00",
          "wednesday": "07:00 – 22:00",
          "saturday": "07:00 – 22:00",
          "monday": "07:00 – 22:00",
          "sunday": "07:00 – 22:00",
          "friday": "07:00 – 22:00",
          "thursday": "07:00 – 22:00"
        }
      },
    },
    {
      'image': 'https://picsum.photos/id/15/200/300',
      'name': 'Otopark 4',
      'occupancy': {
        'free': (Random().nextInt(20) + 1),
        'total': 20,
      },
      "address": '',
      'status': 'Opened',
      'isPaid': true,
      'type': 'OnStreet',
      'openingHours': {
        {
          "tuesday": "07:00 – 22:00",
          "wednesday": "07:00 – 22:00",
          "saturday": "07:00 – 22:00",
          "monday": "07:00 – 22:00",
          "sunday": "07:00 – 22:00",
          "friday": "07:00 – 22:00",
          "thursday": "07:00 – 22:00"
        }
      },
    },
  ];
  String? selectedRegion;
  String? selectedCity;
  var visibility = true;

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> typedMap =
        location.map((key, value) => MapEntry(key, value));

    Object? isSignedIn = ModalRoute.of(context)!.settings.arguments;
    setState(() {
      if (selectedRegion == null || selectedCity == null) {
        visibility = false;
      } else {
        visibility = true;
      }
    });
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Find2Park'),
          backgroundColor: Colors.black,
          actions: isSignedIn != null
              ? [
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      _authService.logout().then((value) {
                        setState(() {
                          isSignedIn = false;
                          Navigator.pushNamed(context, '/chooseRegion');
                        });
                      });
                    },
                  ),
                ]
              : [
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                DropdownButton(
                    hint: Text('Choose Region'),
                    value: selectedRegion,
                    items: regions.map((regions) {
                      return DropdownMenuItem(
                          value: regions, child: Text(regions));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRegion = value as String?;
                        selectedCity = null;
                      });
                    }),
                DropdownButton(
                    hint: Text('Choose City'),
                    value: selectedCity,
                    items: typedMap[selectedRegion]
                        ?.map((city) =>
                            DropdownMenuItem(value: city, child: Text(city)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value as String?;
                      });
                    }),
                Image.network(
                  'https://www.webtekno.com/images/editor/default/0001/35/d428e05b1a77edb88bbc1d88ad1bc79de49cf88f.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      selectedCity == null
                          ? ''
                          : '$selectedCity konumunundaki parkları görebilirsiniz',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Visibility(
                    visible: visibility,
                    child: Card(
                      child: Column(
                        children: parkingList
                            .map(
                              (e) => ListTile(
                                onTap: () {
                                  Navigator.pushNamed(context, '/reservation',
                                      arguments: e);
                                },
                                leading: Icon(Icons.location_on),
                                trailing: CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.black,
                                    child: Text(
                                        e['occupancy']['free'].toString())),
                                title: Text(
                                    selected(selectedCity) + " " + e['name']),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  String selected(selected) {
    if (selected == null) {
      return '';
    } else {
      return '$selected';
    }
  }
}
