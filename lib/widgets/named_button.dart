import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/decoration.dart';

class NamedButton extends StatelessWidget {
  const NamedButton({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffa59c94),
      ),
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            name,
            style: commonTextStyle,
          ),
        ),
      ),
    );
  }
}