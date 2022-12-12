import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.height,
    required this.width
  }) : super(key: key);
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width , height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
