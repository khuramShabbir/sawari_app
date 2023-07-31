import 'package:flutter/material.dart';

class AppTextColors {
  static Color primaryColor = const Color(0xFF7500F8);
  static Color secondaryColor = Colors.black;
  static Color bottomBarBackgroundColor = const Color(0xFFE4CFFB);
  static Color searchBarBackgroundColor = const Color(0xFFE5DDEE);
  static Color greyColor = const Color(0xFF808080);
}

class AppTextStyle {
  static TextStyle headerStyleBlack24 = TextStyle(
    fontSize: 24,
    color: AppTextColors.secondaryColor,
    fontFamily: 'Inter',
  );
  static TextStyle greytext12 = const TextStyle(
    fontSize: 12,
    color: Colors.grey,
    fontFamily: 'Inter',
  );

  static TextStyle blacktext14 = TextStyle(
    fontSize: 14,
    color: AppTextColors.secondaryColor,
    fontFamily: 'Inter',
  );

  static TextStyle blacktext12 = TextStyle(
    fontSize: 12,
    color: AppTextColors.secondaryColor,
    fontFamily: 'Inter',
  );

  static TextStyle blacktext18 = TextStyle(
    fontSize: 18,
    color: AppTextColors.secondaryColor,
    fontFamily: 'Inter',
  );

  static TextStyle headerStylePrimaryText24 = TextStyle(
    fontSize: 24,
    color: AppTextColors.primaryColor,
    fontFamily: 'Inter',
  );
  static TextStyle blacktext8 = TextStyle(
    fontSize: 8,
    color: Colors.black,
    fontFamily: 'Inter',
  );
}

class AppText {
  static String inboxText =
      "No messages right now. Book or offer a ride to\ncontact someone.";
  static String yourTipsLargeText =
      "Your future travel plans\nwill appear here.";
  static String yourTipsgreyText =
      "Find the perfect ride from thousands of\ndestinations, or publish to share your travel costs.";
}
