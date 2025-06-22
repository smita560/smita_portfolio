import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/feature/presentation/view/project/project_card.dart';
import 'package:smita_portfolio/utils/project_utils.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
               width: double.maxFinite,
     padding: EdgeInsets.fromLTRB(25, 25, 25, 60),
    child: Column(children: [
      Text("Work Projects", style: TextStyle(
        color: CusColor.white,
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),),
      SizedBox(height: 50,),
       ConstrainedBox(
    
       constraints: BoxConstraints(maxWidth: 800),
         child: Wrap(
          spacing: 25, 
          runSpacing: 25, 
           children: [
            for(int i = 0; i < workproject.length; i++)
             ProjectCard(project: workproject.first,),
           ],
         ),
       ),
       SizedBox(height:80 ,),
       
      Text(
        "Hobby Projects",
        style: TextStyle(
          color: CusColor.white,
          fontSize: 24,
          fontWeight: FontWeight.w500
        ),
      ),
      SizedBox(height: 50,),
       ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 800),
         child: Wrap(
          spacing: 25, 
          runSpacing: 25, 
           children: [
            for(int i = 0; i < hobbyProject.length; i++)
             ProjectCard(project: workproject.first,),
           ],
         ),
       )
    ],)
    );
  }
}

