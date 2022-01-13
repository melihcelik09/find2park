import 'package:find2park/choose_region.dart';
import 'package:find2park/login.dart';
import 'package:find2park/register.dart';
import 'package:find2park/reservation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// //^ mesela kullanici login oldugunda anasayfa acilir ama geri gelmesini engellemek
//                 //^ icin pushReplacacement kullanmaliyiz.
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => GreenPage()));
//               },
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChooseRegion(),
      routes: {
        '/chooseRegion': (context) => ChooseRegion(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/reservation': (context) => Reservation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

