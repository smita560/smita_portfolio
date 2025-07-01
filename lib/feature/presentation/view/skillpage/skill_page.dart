import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: Platform Items
            Flexible(
              flex: 1,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < platformItems.length; i++)
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: CusColor.kBlack100,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: SvgPicture.asset(
                          platformItems[i]["svg"],
                          color: CusColor.white,
                        ),
                        title: Text(
                          platformItems[i]["title"],
                          style: TextStyle(color: CusColor.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(width: 30),

            // Right: Skill Chips
            Flexible(
              flex: 2,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (int i = 0; i < skillItems.length; i++)
                      Chip(
                        backgroundColor: CusColor.kBlack200,
                        label: Text(
                          skillItems[i]["title"],
                          style: TextStyle(color: CusColor.white),
                        ),
                        avatar: SvgPicture.asset(skillItems[i]["svg"]),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}