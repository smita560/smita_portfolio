import 'package:flutter/material.dart';
import 'package:smita_portfolio/constant/color.dart';
import 'package:smita_portfolio/constant/header.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:CusColor.kBlack200 ,
    child: ListView(
      children: [
        Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 20,top:20,bottom: 20),
      child: IconButton(
        onPressed: (){
      Navigator.of(context).pop();
        },
        icon: Icon(Icons.close, color: CusColor.white,size: 24,),
      ),
    ),
        ),
       for(int i=0; i<navIcon.length;i++)
       ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 30,),
        onTap: (){},
        leading: Icon(navIcon[i],size: 30,color: CusColor.white,),
        title: Text(navTitle[i], style: TextStyle(
    color: CusColor.white,
    fontSize: 12,
    fontWeight: FontWeight.w600
        ),),
       )
      ],
    ),
    );
  }
}

