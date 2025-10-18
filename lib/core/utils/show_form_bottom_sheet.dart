import 'package:flutter/material.dart';

Future<void> showFormBottomSheet({
  required BuildContext context,
  required Widget content,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom;
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: bottomInset + 16,
        ),
        child: SingleChildScrollView(child: content),
      );
    },
  );
}
