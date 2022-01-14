import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class bottomDart extends StatelessWidget {
  const bottomDart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomDart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  EasyLoading.showToast('loading');
                },
                child: Text('toast')),
            ElevatedButton(
                onPressed: () {
                  EasyLoading.showSuccess('loading');
                },
                child: Text('show')),
          ],
        ),
      ),
    );
  }
}
