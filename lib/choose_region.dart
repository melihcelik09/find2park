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
//map user ana database mapin icinde bolgeler iller ve ilceleri
  String? selectedRegion;
  var visibility = true;

  @override
  Widget build(BuildContext context) {
    Object? isSignedIn = ModalRoute.of(context)!.settings.arguments;
    setState(() {
      if (selectedRegion == null) {
        visibility = false;
      } else {
        visibility = true;
      }
    });
    return Scaffold(
        appBar: AppBar(
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
                      });
                    }),
                Image.network(
                  'https://www.webtekno.com/images/editor/default/0001/35/d428e05b1a77edb88bbc1d88ad1bc79de49cf88f.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      selectedRegion == null
                          ? ''
                          : '$selectedRegion konumunundaki parkları görebilirsiniz',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Visibility(
                    visible: visibility,
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.location_on),
                            trailing: CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.black,
                                child: Text('7')),
                            title: Text(selected(selectedRegion)),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            trailing: CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.black,
                                child: Text('7')),
                            title: Text(selected(selectedRegion)),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            trailing: CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.black,
                                child: Text('7')),
                            title: Text(selected(selectedRegion)),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            trailing: CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.black,
                                child: Text('7')),
                            title: Text(selected(selectedRegion)),
                          ),
                        ],
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
