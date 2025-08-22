import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String? content;
  final String? cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback onConfirm;
  const CustomAlertDialog(
      {required this.title,
      this.content,
      this.cancelText,
      required this.confirmText,
      this.onCancel,
      required this.onConfirm,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content ?? ''),
      actions: [
        TextButton(
            onPressed: onCancel,
            child: Text(
              cancelText ?? '',
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            )),
        TextButton(
            onPressed: onConfirm,
            child: Text(confirmText,
                style: TextStyle(color: Theme.of(context).colorScheme.primary)))
      ],
    );
  }
}
