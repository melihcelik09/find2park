import 'package:find2park/bottom.dart';
import 'package:find2park/choose_region.dart';
import 'package:find2park/login.dart';
import 'package:find2park/register.dart';
import 'package:find2park/reservation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance.displayDuration = const Duration(milliseconds: 750);
  EasyLoading.instance.toastPosition = EasyLoadingToastPosition.bottom;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      builder: EasyLoading.init(),
      routes: {
        '/chooseRegion': (context) => ChooseRegion(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/reservation': (context) => Reservation(),
        '/position': (context) => bottomDart(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacementNamed(context, '/chooseRegion');
      // Navigator.pushReplacementNamed(context, '/position');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          SizedBox(height: 25),
          Text("Find2Park",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }
}
