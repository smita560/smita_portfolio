import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/feature/presentation/view/skillpage/skill_widget.dart';

class SkillMobile extends StatefulWidget {
  const SkillMobile({super.key});

  @override
  State<SkillMobile> createState() => _SkillMobileState();
}

class _SkillMobileState extends State<SkillMobile> {
  @override
  Widget build(BuildContext context) {
    return  Column(
                            children: [
                               for( int i=0 ;i<platformItems.length;i++)
                              Container(
                              margin: EdgeInsets.only(bottom: 5),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: CusColor.kBlack400,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                leading: Image.asset(platformItems[i]["svg"], width: 26,),
                                title: Text(platformItems[i]["title"], style: TextStyle(color: CusColor.white)),
                              ),
                                             ),
                            
                          
                        
                    
              
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  for(int i=0; i<skillItems.length;i++)
                Column(
                  children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  ),
                  Chip(
                    backgroundColor: CusColor.kBlack200,
                    label: Text(skillItems[i]["title"], style: TextStyle(color: CusColor.white),),
                    avatar: Image.asset(skillItems[i]["img"]),
                  ),
                ],
                                )
                ],
              ),
    ]);
  }
}