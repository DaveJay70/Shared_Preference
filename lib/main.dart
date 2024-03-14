import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen.dart';
import 'Screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool?> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isChecked = prefs.getBool("isRemember");
    print(isChecked);
    return isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
        future: getData(),
        builder: (context,snapshot){
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:  snapshot.hasData ?  Screen2() : Screen(),
          );
        });
  }
}




