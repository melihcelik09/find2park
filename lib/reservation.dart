import 'package:find2park/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  AuthService _authService = AuthService();
  var hoursVisible = false;
  @override
  Widget build(BuildContext context) {
    final parkingInfo = ModalRoute.of(context)!.settings.arguments as Map;
    DateTime date = DateTime.now();
    String reserveDate = DateFormat.yMd().format(date);
    String reserveTime = DateFormat.Hm().format(date);
    var days = [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/reserveHolder.png'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              parkingInfo['name'],
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            //Altina textbutton ekle basinca alttaki saatlerin visibilitysi tetiklensin.
                            Text(
                                "${days[date.weekday - 1].toUpperCase()} ${parkingInfo['openingHours'][days[date.weekday - 1]]}"),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    hoursVisible = !hoursVisible;
                                  });
                                },
                                child: Text(
                                  'VIEW ALL HOURS',
                                  style: TextStyle(color: Colors.grey.shade600),
                                )),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            children: [
                              Text(
                                parkingInfo['status'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                parkingInfo['type'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                parkingInfo['isPaid'] ? 'Paid' : 'Free',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    _authService.reserve(
                                        parkingInfo['name'],
                                        days[date.weekday - 1].toUpperCase(),
                                        reserveDate,
                                        reserveTime,
                                        parkingInfo['type'],
                                        parkingInfo['isPaid']);
                                    EasyLoading.showToast(
                                        'Reservation Successful');
                                  },
                                  child: Text('Reserve'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black)),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 392.7,
              child: Card(
                child: Center(
                  child: Text(
                    'Free Occupancy: ${parkingInfo['occupancy']['free'] / parkingInfo['occupancy']['total'] * 100}%',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: hoursVisible,
              child: Card(
                  child: Center(
                child: Column(
                  children: [
                    Text("Opening Hours:", style: TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      //hangi gunde oldugumuza gore yazdir.
                      children: days
                          .map((e) => Text(
                              '${e.toUpperCase()} ${parkingInfo['openingHours'][e]}'))
                          .toList(),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
