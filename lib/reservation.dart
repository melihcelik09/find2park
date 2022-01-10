import 'package:flutter/material.dart';

class Reservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parkingInfo = ModalRoute.of(context)!.settings.arguments as Map;
    print(parkingInfo);
    print(parkingInfo['image']);
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Reservation'),
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('${parkingInfo['name']}'),
            centerTitle: true,
            background: Image.network(parkingInfo['image'].toString(),
                fit: BoxFit.cover),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Parking Name: ${parkingInfo['name']}'),
                Text('Parking Address: ${parkingInfo['address']}'),
                Text(
                    'Parking Price: ${parkingInfo['isPaid'] ? 'Paid' : 'Free'}'),
                Text(
                    'Parking Remaining Slots: ${parkingInfo['occupancy']['free']}'),
                Text('Parking Capacity: ${parkingInfo['occupancy']['total']}'),
                Text('Parking Available: ${parkingInfo['status']}'),
                Text('Parking Phone: ${parkingInfo['phone']}'),
                Text('Parking Description: ${parkingInfo['description']}'),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
