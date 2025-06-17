import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';

class CusFormField extends StatelessWidget {
    final  String hinttext;
    final String?   labeltext;
    final Color bordercolor;
  final TextEditingController controller;
  final Color hinttextcolor = CusColor.kBlack100;
  final Color labeltextcolor = CusColor.kBlack1000;
  final Color fillcolor = CusColor.white;
  final Color focusedBorderColor = CusColor.kBlack1000;
  final Color enabledBorderColor = CusColor.kBlack1000;
  final Color borderColor = CusColor.kBlack1000;
  final double borderRadius = 8.0;
  final double fontSize = 16.0;
  final double labelFontSize = 14.0;
  final double hintFontSize = 14.0;
  final double padding = 16.0;
  final double height = 50.0;
  final double width = double.infinity;
  final  int  maxLines;
 
  const CusFormField({
    required this.hinttext,
    this.labeltext,
    required this.bordercolor,
    required this.controller,
    this.maxLines = 1,
    
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    TextFormField(
        maxLines: maxLines,
        style: TextStyle(color: CusColor.kBlack100,fontSize: 16,fontWeight: FontWeight.w500),
        controller: controller,
        decoration: InputDecoration(
           hintText: hinttext,
          hintStyle: TextStyle(color: CusColor.kBlack100),
          filled: true,
          fillColor: CusColor.white,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: CusColor.kBlack1000),
          ),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: CusColor.kBlack1000),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: CusColor.kBlack1000),
          ),
        ),
      ),
    ]);
  }
}