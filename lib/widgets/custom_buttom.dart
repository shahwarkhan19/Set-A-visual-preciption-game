import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  final String text;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent,
            blurRadius: 5,
            spreadRadius: 0,

          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style:  TextStyle(
            color: Colors.black.withOpacity(.8),
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
        ),
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
          fixedSize: const Size(250,40),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(250)
          )
        ),
      ),
    );
  }
}