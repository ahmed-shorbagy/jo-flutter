import 'package:flutter/material.dart';

/// Class for defining and managing app-wide text styles.
/// Provides named constants for font families, weights, sizes, and line heights.
/// Encapsulates styling for consistent usage throughout the app.
class AppStyles {
  ///TODO: font styles must be adjusted to be responsive for different screen sizes
  ///there is many approaches to do this
  ///it can remain like this untill we decide how to do it
  static const String ralewayFontFamily = 'Raleway';
  static const String interFontFamily = 'Inter';

  static const TextStyle ralewayMedium12 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 12,
    height: 1.4, // 140%
  );

  static const TextStyle ralewaySemiBold16 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 16,
    height: 1.4, // 140%
  );

  static const TextStyle interSemiBold10 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w600, // Semi Bold
    fontSize: 10,
    height: 1.4, // 140%
  );

  static const TextStyle ralewayMedium16 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 16,
    height: 1.4, // 140%
  );
  static const TextStyle ralewayMedium18 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 18,
    height: 1.4, // 140%
  );

  static const TextStyle ralewayLight15 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w300, // Light
    fontSize: 15,
    height: 1.4, // 140%
  );

  static const TextStyle ralewayLight16 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w300, // Light
    fontSize: 16,
    height: 1.4, // 140%
  );
  static const TextStyle ralewayLight18 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w300, // Light
    fontSize: 18,
    height: 1.4, // 140%
  );

  static const TextStyle interBold20 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w700, // Bold
    fontSize: 20,
    height: 1.4, // 140%
  );

  static const TextStyle ralewayBold16 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w700, // Bold
    fontSize: 16,
    height: 1.4, // 140%
  );

  static const TextStyle ralewayLight14 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w300, // Light
    fontSize: 14,
    height: 1.4, // 140%
  );

  static const TextStyle interSemiBold14 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w600, // Semi Bold
    fontSize: 14,
    height: 1.0, // 100%
  );

  static const TextStyle ralewayBold12 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w700, // Bold
    fontSize: 12,
    height: 1.4, // 140%
  );

  static const TextStyle interSemiBold12 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w600, // Semi Bold
    fontSize: 12,
    height: 1.0, // 100%
  );

  static const TextStyle interExtraBold14 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w800, // Extra Bold
    fontSize: 14,
    height: 1.0, // 100%
  );

  static const TextStyle interRegular12 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 12,
    height: 1.0, // 100%
  );

  static const TextStyle interRegular16 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 16,
    height: 1.0, // 100%
  );

  static const interRegular16RemoteSingleLineBodyBase = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 16,
    height: 1.4, // 140%
  );

  static const interRegular20 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 20,
    height: 1.2, // 120%
  );

  static const interRegular20RemoteSubheading = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 20,
    height: 1.2, // 120%
  );

  static const ralewayBold14 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w700, // Bold
    fontSize: 14,
    height: 1.4, // 140%
  );

  static const interRegular9 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 9,
    height: 1.0, // 100%
  );

  static const interExtraBold12 = TextStyle(
    fontFamily: interFontFamily,
    fontWeight: FontWeight.w800, // Extra Bold
    fontSize: 12,
    height: 1.0, // 100%
  );

  static const ralewayRegular12 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 12,
    height: 1.4, // 140%
  );
  static const ralewayRegular20 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 20,
    height: 1.4, // 140%
  );

  static const ralewaySemiBold20 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 20,
    height: 1.0, // 100%
  );
  static const ralewaySemiBold22 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 22,
    height: 1.0, // 100%
  );
  static const ralewaySemiBold25 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 25,
    height: 1.0, // 100%
  );
  static const ralewaySemiBold65 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 65,
    height: 1.0, // 100%
  );
  static const ralewayExtraBold15 = TextStyle(
    fontFamily: ralewayFontFamily,
    fontWeight: FontWeight.w800, // ExtraBold
    fontSize: 15,
    height: 1.0, // 100%
  );
}
