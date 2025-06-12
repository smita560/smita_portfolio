import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';

class LogoWidget extends StatefulWidget {
    final VoidCallback? onTap;
  const LogoWidget({super.key,  this.onTap});


  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return   CircleAvatar(
            backgroundColor: CusColor.kR900,
            child: GestureDetector(
              onTap: widget.onTap, 
              child: Text("SK",style: TextStyle(
                  color: CusColor.kBlack100,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  
                  
              )),
            ),
          );
  }
}