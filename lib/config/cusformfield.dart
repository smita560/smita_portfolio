import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';

class CusFormField extends StatelessWidget {
  final String hinttext;
  final String? labeltext;
  final Color bordercolor;
  final TextEditingController controller;
  final int maxLines;

  const CusFormField({
    super.key,
    required this.hinttext,
    this.labeltext,
    required this.bordercolor,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (labeltext != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              labeltext!,
              style: TextStyle(
                color: CusColor.kBlack1000,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            style: TextStyle(
              color: CusColor.kBlack100,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: TextStyle(
                color: CusColor.kBlack100,
                fontSize: 14,
              ),
              filled: true,
              fillColor: CusColor.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: bordercolor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: CusColor.kBlack1000),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: CusColor.kBlack1000),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
