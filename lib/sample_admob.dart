import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'show_app_ad.dart';

class SampleAdmob extends StatefulWidget {
  const SampleAdmob({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<SampleAdmob> createState() => _SampleAdmobState();
}

class _SampleAdmobState extends State<SampleAdmob> {
  late BannerAd _ad;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _initializeBannerAd();
  }

  void _initializeBannerAd() {
    _ad = BannerAd(
      size: AdSize.banner,
      // adUnitId: 'ca-app-pub-5686123534085571/2097698383',
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {}),
      request: AdRequest(),
    );
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: ElevatedButton(
              onPressed: () => ShowAppAd.showAd(),
              child: Text(
                'Press me',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Text('This is admob sample'),
        ],
      )),
      bottomNavigationBar: _isLoaded
          ? SizedBox(
              width: _ad.size.width.toDouble(),
              height: _ad.size.height.toDouble(),
              child: AdWidget(
                ad: _ad,
              ),
            )
          : const SizedBox(
              height: 50,
              width: double.infinity,
              child: Center(child: Text('Hey, Watch my ads!!')),
            ),
    );
  }
}
