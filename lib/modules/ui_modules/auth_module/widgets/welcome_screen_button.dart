import 'package:flutter/material.dart';

class WelcomeScreenButton extends StatelessWidget {
  const WelcomeScreenButton({
    Key? key,
    required this.displayWidth,
    required this.displayHeight,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final dynamic displayWidth;
  final dynamic displayHeight;
  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(displayWidth * 0.02),
        ),
        elevation: 5,
        minimumSize: Size(
          displayWidth * 0.6,
          displayHeight * 0.07,
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
