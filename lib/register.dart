import 'package:find2park/service/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var genders = ['Male', 'Female', 'Other'];
  var regions = [
    'Akdeniz Bölgesi',
    'Doğu Anadolu Bölgesi',
    'Ege Bölgesi',
    'Güneydoğu Anadolu Bölgesi',
    'İç Anadolu Bölgesi',
    'Karadeniz Bölgesi',
    'Marmara Bölgesi',
  ];
  String? selectedGender;
  String? selectedRegion;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _licenceController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passAgainController = TextEditingController();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Find2Park'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: 300,
            child: Column(
              children: [
                TextField(
                  textCapitalization: TextCapitalization.words,
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textCapitalization: TextCapitalization.words,
                  controller: _surNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Surname',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  textCapitalization: TextCapitalization.characters,
                  controller: _licenceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Licence Plate',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  controller: _passController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  controller: _passAgainController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password Again',
                  ),
                ),
                DropdownButton(
                    hint: Text('Choose Province'),
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
                DropdownButton(
                    hint: Text('Select Gender'),
                    value: selectedGender,
                    items: genders.map((genders) {
                      return DropdownMenuItem(
                          value: genders, child: Text(genders));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    }),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      _authService
                          .register(
                              _nameController.text,
                              _surNameController.text,
                              _emailController.text,
                              _phoneController.text,
                              _licenceController.text.toUpperCase(),
                              _passController.text,
                              selectedRegion.toString(),
                              selectedGender![0].toString())
                          .then((value) {
                        return Navigator.pushNamed(context, '/login');
                      });
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
