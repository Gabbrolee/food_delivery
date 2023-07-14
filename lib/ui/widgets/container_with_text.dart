import 'package:flutter/material.dart';


class ContainerWithText extends StatelessWidget {
  const ContainerWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        alignment: Alignment.center,
        height: 270,
        width: 220,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text("Hello", maxLines: 2,),
              ),
              SizedBox(height: 30,),
              Text("N 1900", style: TextStyle(color: Color(0xFFFA4A0C)),)
            ],
          ),
        ),
      ),
    );
  }
}
