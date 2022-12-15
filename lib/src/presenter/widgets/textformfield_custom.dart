import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key,
    required this.labelText,
    required this.validator,
    required this.maxLine,
    required this.controller,
    }) : super(key: key);
  final String labelText;
  final int maxLine;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      style: GoogleFonts.quicksand(fontSize: 18),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.quicksand(fontSize: 18),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 0.5,color: Colors.grey.shade400)
        ),
      ),
    );
  }

}
