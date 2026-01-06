import 'package:e_com/pages/api_test.dart';
import 'package:e_com/pages/categories.dart';
import 'package:e_com/pages/check.dart';
import 'package:e_com/pages/main.dart';
import 'package:e_com/pages/main2.dart';
import 'package:e_com/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_com/pages/login.dart';
import 'package:e_com/pages/sign_up.dart';
import 'package:e_com/pages/forgot_pass.dart';






Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
      '/login': (context)=>login(),
      '/sign_up':(context)=>sign_up(),
      '/forgot_pass':(context)=>forgot_pass(),
      '/main' : (context) =>MainShell(),
      '/main2' : (context)=>main2(),
      '/check' : (context)=>check(),
      '/categories' : (context)=>categories(),

    },
  ));
}

