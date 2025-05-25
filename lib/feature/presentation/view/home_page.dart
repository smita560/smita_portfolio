import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smita_portfolio/constant/color.dart';
import 'package:smita_portfolio/constant/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CusColor.kBlack200,
      body: ListView(
      scrollDirection: Axis.vertical,
        children: [
          Container(
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
      CircleAvatar(
        backgroundColor: CusColor.kR900,
        child: Text("SK",style: TextStyle(
          color: CusColor.kBlack100,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          
          
        )),
      ),
      Spacer(),
      for(int i=0; i<navTitle.length; i++) 
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(onPressed: (){}, child: Text(navTitle[i],style: TextStyle(color:CusColor.white,fontSize: 16,fontWeight: FontWeight.w500),)),
      )
    ],
  ),
),
),
Container(
  height: 500,
  width: double.maxFinite,
  color:CusColor.kP800
),
Container(
  height: 500,
  width: double.maxFinite,
  color: CusColor.kBlack200,
),
Container(
  height: 500,
  width: double.maxFinite,
  color:CusColor.kP800
),
Container(
  height: 500,
  width: double.maxFinite,
color: CusColor.kBlack200,
),
Container(
  height: 500,
  width: double.maxFinite,
  color:CusColor.kP800
),
        ],
      ),
    );
  }
}