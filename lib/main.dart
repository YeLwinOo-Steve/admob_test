import 'dart:io';

import 'package:admob_sample/sample_admob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'show_app_ad.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const AdmobApp());
}

class AdmobApp extends StatelessWidget {
  const AdmobApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admob Sample',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SampleAdmob(title: 'Sample Admob'),
    );
  }
}
