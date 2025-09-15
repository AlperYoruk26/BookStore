import 'package:flutter/material.dart';

Widget getCardType(String value) {
  if (value.startsWith('4')) {
    return Image.network(
      "https://cdn4.iconfinder.com/data/icons/flat-brand-logo-2/512/visa-512.png",
      fit: BoxFit.contain,
      width: 10,
      height: 10,
    );
  } else if (RegExp(r'^5[1-5].*').hasMatch(value) ||
      RegExp(r'^2(2[2-9]|[3-6][0-9]|7[01]|720).*').hasMatch(value)) {
    return Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/960px-Mastercard-logo.svg.png",
      fit: BoxFit.contain,
      width: 10,
      height: 10,
    );
  } else {
    return const SizedBox();
  }
}
