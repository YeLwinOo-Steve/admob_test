import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class ShowAppAd{
  static AppOpenAd? _appOpenAd;

  static String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/3419835294'
      : 'ca-app-pub-3940256099942544/5662855259';

  static Future<void> loadOpenAd() async {
    await AppOpenAd.load(
      adUnitId: adUnitId,
      orientation: AppOpenAd.orientationPortrait,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          // _appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
      request: AdRequest(),
    );
  }

  static void showAd() {
    if (_appOpenAd == null) {
      print("TRYING TO SHOW AD");
      loadOpenAd();
      return;
    }
    _appOpenAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
          print('onAdShowedFullScreenContent');
        }, onAdFailedToShowFullScreenContent: (ad, error) {
          print("DISPOSE AD");
          ad.dispose();
          _appOpenAd = null;
          loadOpenAd();
        }, onAdDismissedFullScreenContent: (ad) {
          print("onAdDismissedFullScreenContent AD");
          ad.dispose();
          _appOpenAd = null;
          loadOpenAd();
        });
    _appOpenAd!.show();
  }
}