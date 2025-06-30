import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/utils/project_utils.dart';
import 'dart:js'as js;

class ProjectCard extends StatelessWidget {
  const ProjectCard({ 
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 350 ,
      width: 350,
      decoration: BoxDecoration(
        color: CusColor.kBlack500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/project/vmgd.jpeg",height: 120,width: 250,
          fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12,15,12,12),
            child: Text(project.title,style: TextStyle(
              color: CusColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),),
          ),
          Padding(
           padding: const EdgeInsets.fromLTRB(12,0,12,12),
            child: Text(project.description,style: TextStyle(
              color: CusColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w800
            ),),
          ),
          Spacer(),
          Container(
                 color: CusColor.kBlack600,
                 padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                 child: Row(children: [
                  Text("Available on ",style: TextStyle(
                    color: CusColor.kY600,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                  Spacer(),
                  if(project.iosLink!= null)
                  InkWell(
                    onTap: (){
                      js.context.callMethod('open', [project.iosLink]);
                    },
                    child: SvgPicture.asset("assets/project/apple-brands-solid.svg",height: 20,width: 20,color: CusColor.kBlack1000,)),
                  SizedBox(width: 10,),
                  if(project.andriodLink!= null)
                  InkWell(
                      onTap: (){js.context.callMethod('open', [project.andriodLink]);},
                    child: SvgPicture.asset("assets/project/android-brands-solid.svg",height: 20,width: 20,color: CusColor.kBlack1000,)),
                    SizedBox(width: 10,),
                    if(project.webLink!= null)
                  InkWell(
                      onTap: (){
                        js.context.callMethod('open', [project.webLink]);
                      },
                    child:SvgPicture.asset("assets/project/globe-solid.svg",height: 20,width: 20,color: CusColor.kBlack1000)),
                 ],),
          ),
          
        ],
      ),
    );
  }
}



