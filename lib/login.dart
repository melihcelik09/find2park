import 'package:find2park/service/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: Text('Find2Park'),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          margin: EdgeInsets.only(top: 120, left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
              SizedBox(height: 20),
              Text('Sign in to continue'),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  // suffixIcon: IconButton(
                  //     onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      _authService
                          .login(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        bool isSignedIn = true;
                        return Navigator.pushNamed(context, '/chooseRegion',
                            arguments: isSignedIn);
                        // return Navigator.of(context).pushReplacementNamed(
                        //     '/chooseRegion',
                        //     arguments: isSignedIn);
                      });
                    },
                    child: Text('Login')),
              ),
              SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text('Register'))),
            ],
          ),
        )),
      ),
    );
  }
}
