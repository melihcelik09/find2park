import 'package:flutter/material.dart';

class Reservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parkingInfo = ModalRoute.of(context)!.settings.arguments as Map;
    DateTime date = DateTime.now();
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
      body: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      parkingInfo['name'],
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    //Altina textbutton ekle basinca alttaki saatlerin visibilitysi tetiklensin.
                    Text(
                        "${days[date.weekday - 1].toUpperCase()} ${parkingInfo['openingHours'][days[date.weekday - 1]]}")
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Text(
                      parkingInfo['status'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      parkingInfo['type'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                'Free Occupancy: ${parkingInfo['occupancy']['free'] / parkingInfo['occupancy']['total'] * 100}%',
                style: TextStyle(fontSize: 24),
              ),
              Divider(
                color: Colors.black,
              ),
              Text('Parking Price: ${parkingInfo['isPaid'] ? 'Paid' : 'Free'}',
                  style: TextStyle(fontSize: 24)),
              Divider(
                color: Colors.black,
              ),
              Text("Opening Hours:", style: TextStyle(fontSize: 24)),
              SizedBox(
                height: 10,
              ),
              Column(
                //hangi gunde oldugumuza gore yazdir.
                children: days
                    .map((e) => Text(
                        '${e.toUpperCase()} ${parkingInfo['openingHours'][e]}'))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Reserve'),
                    style: ElevatedButton.styleFrom(primary: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
