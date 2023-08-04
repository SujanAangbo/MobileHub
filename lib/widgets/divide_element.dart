import 'package:flutter/material.dart';


class DivideElement extends StatelessWidget {
  const DivideElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 10,
      thickness: 2,
      color: Colors.grey,
    );
  }
}