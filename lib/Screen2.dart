import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("WelCome My Application"),backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove("IsRemember").then((value) {
                  return Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Screen(),
                  ));
                });
              }, child: Text('Sign Out'))
            ],
          ),
        ),
      ),
    );
  }
}
