// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';
const Color primary = Color.fromARGB(199, 23, 82, 72);
const Color secundary = Color.fromARGB(255, 77, 182, 172);
const Color terciary = Color.fromARGB(255, 27, 94, 32);
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> liststring = Utils.renderListstring();
  List<bool> listCheckbox = Utils.renderListCheck();
  List<String> ls = [];
  List<bool> lc = [];
  int x = 0;
  @override
  Widget build(BuildContext context) {
    if (x == 0){
      resetstate();
    }
    x = 1;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primary,
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    resetstate();
                  });
                },
                child: Text("RESET"))
          ],
          backgroundColor: Colors.tealAccent[400],
          centerTitle: true,
          title: Text(
            '-Checkbox List-',
            style: TextStyle(color: Colors.indigo[900], fontSize: 30),
          ),
        ),
        body: Center(
          child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: liststring.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lc[index] ? secundary : terciary,
                  ),
                  child: Row(
                    children: [
                      Text(
                        ls[index],
                        style: TextStyle(fontSize: 25),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Checkbox(
                              value: lc[index],
                              onChanged: (value) {
                                setState(() {
                                  lc[index] = !lc[index];
                                  
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
  resetstate(){
    ls = []..addAll(liststring);
    lc = []..addAll(listCheckbox); 
  }
}

class Utils {
  static String generateRandomString(int len) {
    var random = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[random.nextInt(_chars.length)])
        .join();
  }

  static bool generateRandomEnabledState() {
    var random = Random();
    return random.nextInt(2) == 0 ? false : true;
  }

  static List<String> renderListstring() {
    List<String> list = [];
    for (int i = 0; i < 1000; i++) {
      list.add(Utils.generateRandomString(10));
    }
    return list;
  }

  static List<bool> renderListCheck() {
    List<bool> listbool = [];
    for (int i = 0; i < 1000; i++) {
      listbool.add(Utils.generateRandomEnabledState());
    }
    return listbool;
  }
}
