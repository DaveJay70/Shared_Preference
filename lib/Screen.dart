import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen2.dart';

class Screen extends StatefulWidget {
  Screen({super.key});

  @override
  State<Screen> createState() => _Screen4State();
}

TextEditingController usercontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

class _Screen4State extends State<Screen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isRemember = false;

  Future<bool?> setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isRemember', isRemember);
    bool? isChecked = prefs.getBool("isRemember");
    print(isChecked);
    return isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Text Demo ",
          style: TextStyle(fontFamily: 'Oswald'),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            const Text(
              "Login Form  ",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 30,
                fontFamily: 'Oswald',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (usercontroller.text.isEmpty) {
                      return "Please Enter UserName";
                    }
                  },
                  controller: usercontroller,
                  style: TextStyle(height: 1, color: Colors.deepPurpleAccent),
                  decoration: InputDecoration(
                      hintText: "Enter UserName",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (passwordcontroller.text.isEmpty) {
                      return "Please Enter Password";
                    }
                  },
                  controller: passwordcontroller,
                  style: TextStyle(height: 1, color: Colors.deepPurpleAccent),
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Checkbox(
              value: isRemember,
              onChanged: (value) {
                setState(() {
                  isRemember = !isRemember;
                  setData();
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Screen2();
                      },
                    ));
                  }
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }
}
