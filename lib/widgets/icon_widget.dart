import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  IconWidget({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  IconData icon;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
