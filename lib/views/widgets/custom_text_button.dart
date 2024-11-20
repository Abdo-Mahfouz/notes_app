import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text, required this.function,  this.isLoading =false
  });
final String text;
final VoidCallback function;
final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kPrimaryColor,
      ),
      child: TextButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}