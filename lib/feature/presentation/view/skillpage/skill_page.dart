import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/feature/presentation/view/skillpage/skill_widget.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
        children: [
          Container(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 60),
                width: double.maxFinite,
                color:CusColor.kBlack100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
               children: [
               Text("What I  can do  ", style: TextStyle(
               color: CusColor.white,
             fontSize: 20,
             fontWeight: FontWeight.w600
             ),),
             SizedBox(height: 50,),
            Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                children: [
                  for( int i=0 ;i<platformItems.length;i++)
                  Container(width: 200,
                  decoration: BoxDecoration(color: CusColor.kBlack100,
                  borderRadius: BorderRadius.circular(5),
                  ),
                 child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  leading: Image.asset(platformItems[i]["svg"], color: CusColor.white,  ),
                  title: Text(platformItems[i]["title"],style: TextStyle(color: CusColor.white),),
                 ),
                )
                     ],
                   ),
              ),
              SizedBox(width: 30,),
             Flexible(
               child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                 child: Wrap(
                  spacing: 10 ,
                  runSpacing: 10,
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
                 ]),
               ),
             )
          
            ],
          )
          ],
                ),
          
              ),
        ],
      ),
    );
  }
}