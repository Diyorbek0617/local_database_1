import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:local_database_1/pages/sign_in.dart';
import 'package:local_database_1/pages/sign_up.dart';

void main() async{

  await Hive.initFlutter();
  await Hive.openBox("pdp online");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Sign_in(),
      routes: {
        Sign_in.id:(context)=>Sign_in(),
        Sign_up.id:(context)=>Sign_up(),
      },
    );
  }
}
