import 'package:flutter/material.dart';

Color getCardColor(String value) {
  if (value.startsWith('4')) {
    return Colors.blueAccent;
  } else if (RegExp(r'^5[1-5].*').hasMatch(value)) {
    return Colors.red;
  } else {
    return Colors.purple;
  }
}
