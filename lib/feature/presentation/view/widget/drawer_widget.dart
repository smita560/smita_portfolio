import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/config/header.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key, required this.onNavItemtap,
  });
  final Function (int) onNavItemtap;

  @override
  Widget build(BuildContext context) {
    return 
      Drawer(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/project/concentric_circle.png"),
                fit: BoxFit.cover,
              ),
            ),
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
          Divider(
            color: CusColor.kBlack300,
            thickness: 2,
          ),
         for(int i=0; i<navIcon.length;i++)
         ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30,),
          onTap: (){
            onNavItemtap(i);
          },
          leading: Icon(navIcon[i],size: 30,color: CusColor.white,),
          title: Text(navTitle[i], style: TextStyle(
      color: CusColor.white,
      fontSize: 12,
      fontWeight: FontWeight.w600
          ),),
         )
        ],
      ),
      ),
    );
  }
}

