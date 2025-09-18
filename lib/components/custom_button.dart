import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? onColor;
  final double? width;
  final VoidCallback onTap;
  const CustomButton(
      {required this.child,
      this.color,
      this.onColor,
      this.width,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.1,
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        // child: Text(
        //   title,
        //   style:
        //       TextStyle(color: onColor ?? Theme.of(context).colorScheme.onPrimary),
        // ),
        child: DefaultTextStyle.merge(
            style:
                TextStyle(color: onColor ?? Theme.of(context).colorScheme.onPrimary),
            child: child),
      ),
    );
  }
}
