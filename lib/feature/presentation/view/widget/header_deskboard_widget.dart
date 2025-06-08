import 'package:flutter/material.dart';
import 'package:smita_portfolio/constant/color.dart';
import 'package:smita_portfolio/constant/header.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/logo_widget.dart';

 class HeaderDeskboard extends StatelessWidget {
  const HeaderDeskboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Colors.transparent,
          Colors.black45]
      ),
      borderRadius: BorderRadius.circular(100),
      ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
         LogoWidget(onTap: () {
           
         },),
          Spacer(),
          for(int i=0; i<navTitle.length; i++) 
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(onPressed: (){}, child: Text(navTitle[i],style: TextStyle(color:CusColor.white,fontSize: 16,fontWeight: FontWeight.w500),)),
          )
        ],
      ),
    ),
    );
  }
}