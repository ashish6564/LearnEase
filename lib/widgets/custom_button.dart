import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  double horizontalPadding;
  double verticalPadding;

   CustomButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor = const Color(0xff9E9CFF), // Default color
    this.textColor = Colors.white,
    this.horizontalPadding = 32,
    this.verticalPadding = 16,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor, // Background color
        padding: EdgeInsets.symmetric(horizontal:widget.horizontalPadding, vertical:widget.verticalPadding), // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor, // Text color
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
