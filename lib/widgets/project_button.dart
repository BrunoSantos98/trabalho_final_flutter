import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final Icon? icon;

  const CustomButton({super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.padding = 16.0,
    this.icon
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: widget.onPressed,
        icon: widget.icon != null ? Icon(
          widget.icon!.icon,
          color: widget.textColor
        ) : Container() ,
        label: Text(
         widget.text,
         style: TextStyle(
           color: widget.textColor,
           fontSize: 16.0
         ),
        ),
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        padding: EdgeInsets.symmetric(horizontal: widget.padding, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius)
        )
      ),
    );
  }
}