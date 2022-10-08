import 'package:flutter/material.dart';

// Horizontal Spacing
const Widget hSpaceSmall = SizedBox(width: 10.0);
const Widget hSpaceMin = SizedBox(width: 5.0);
const Widget hSpaceRegular = SizedBox(width: 18.0);
const Widget hSpaceMedium = SizedBox(width: 25.0);
const Widget hSpaceLarge = SizedBox(width: 50.0);

// Vertical Spacing
const Widget vSpaceMin = SizedBox(height: 5.0);
const Widget vSpaceSmall = SizedBox(height: 10.0);
const Widget vSpaceRegular = SizedBox(height: 18.0);
const Widget vSpaceMedium = SizedBox(height: 25.0);
const Widget vSpaceLarge = SizedBox(height: 50.0);

// Screen Size helpers

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
