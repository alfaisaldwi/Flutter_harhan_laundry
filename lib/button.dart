
import 'package:flutter/material.dart';
import 'package:harhan_laundry/constant.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color color, textColor;
  const Button({
    Key? key, 
    required this.text, 
    required this.press, 
    this.color = kPrimaryColor, 
    this.textColor = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: const EdgeInsets.symmetric(vertical:20, horizontal: 40),
            textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          onPressed: press,
        )
      )
    );
  }
}

