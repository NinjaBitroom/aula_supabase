import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blue),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 72,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}
