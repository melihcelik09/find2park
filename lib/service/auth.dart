import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> login(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  logout() async {
    return await _auth.signOut();
  }

  Future<User?> register(
    String name,
    String surname,
    String email,
    String phone,
    String licence,
    String password,
    String selectedRegion,
    String selectedGender,
  ) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore
        .collection('users')
        .doc(user.user!.uid)
        .set({
          'firstName': name,
          'lastName': surname,
          'email': email,
          'phoneNumber': phone,
          'licencePlate': licence,
          'province': selectedRegion,
          'gender': selectedGender,
        })
        .then((value) => print('User added'))
        .catchError((error) => print("Failed to add user: $error"));
    return user.user;
  }

  fillMap(String region, List<String> list) {
    list.map((e) {
      _firestore
          .collection('map')
          .doc(region)
          .collection('province')
          .doc(e)
          .set({});
    }).toList();
  }
}
