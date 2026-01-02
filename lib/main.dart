import 'package:e_com/pages/api_test.dart';
import 'package:e_com/pages/categories.dart';
import 'package:e_com/pages/check.dart';
import 'package:e_com/pages/main.dart';
import 'package:e_com/pages/main2.dart';
import 'package:e_com/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:e_com/pages/login.dart';
import 'package:e_com/pages/sign_up.dart';
import 'package:e_com/pages/forgot_pass.dart';






void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
      '/sign_up':(context)=>sign_up(),
      '/login': (context)=>login(),
      '/forgot_pass':(context)=>forgot_pass(),
      '/main' : (context) =>MainShell(),
      '/main2' : (context)=>main2(),
      '/check' : (context)=>check(),
      '/categories' : (context)=>categories(),

    },
  ));
}

