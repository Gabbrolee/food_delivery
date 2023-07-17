import 'package:flutter/material.dart';

class PlusAndMinusCart extends StatelessWidget {
  const PlusAndMinusCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFFA4A0C)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            "-",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "+",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
