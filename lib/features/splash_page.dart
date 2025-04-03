import 'dart:async';

import 'package:cek_khodam/cores/utils/strings.dart';
import 'package:cek_khodam/features/main/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      precacheImage(const AssetImage(mainBack), context).then((value) =>
          {Navigator.pushReplacementNamed(context, MainPage.routeName)});
    });
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(splashPage), context);
    precacheImage(const AssetImage(text), context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(splashPage),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Image(image: AssetImage(text)),
          )),
    );
  }
}
