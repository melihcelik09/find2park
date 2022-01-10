import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    //QuerySnapshot
    // CollectionReference ref = _firestore.collection('map');
    //DocumentSnapshot
    // var regionRef = ref.doc();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //     onPressed: () async {
            //       var response = await ref.get();
            //       var regions = response.docs.map((doc) => doc.id).toList();
            //       // var regions = fetchData('map/');
            //       print(regions);
            //       var province = fetchData('map/' + regions[0] + '/province');
            //     },
            //     // /map/Akdeniz Bölgesi/province/Adana
            //     child: Text("Fetch")),
            ElevatedButton(
                onPressed: () {
                  _firestore.collection('map').get().then((value) {
                    print(value.docs.map((doc) => doc.id).toList());
                  });
                  _firestore.collection('map').get().then((querySnapshot) {
                    querySnapshot.docs.forEach((result) {
                      _firestore.collection('map/regions');
                    });
                  });
                },
                child: Text("Fetch")),
          ],
        ),
      ),
    );
  }

  fetchData(path) {
    List data = [];
    _firestore.collection(path).get().then(
      (querySnaphot) {
        for (var doc in querySnaphot.docs) {
          data.add(doc.id);
        }
        print(data);
      },
    );
  }
}
