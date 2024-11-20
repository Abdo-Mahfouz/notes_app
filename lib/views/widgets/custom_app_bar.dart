import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,this.title, this.icon, this.actionFunction
  });
final String ?title;
final IconData? icon;
final void Function()? actionFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         title??'',
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(.05)),
          child: Center(
            child: IconButton(
              onPressed: actionFunction,
              icon: Icon(icon,size: 24,),
            ),
          ),
        ),
      ],
    );
  }
}
