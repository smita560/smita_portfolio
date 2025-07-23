import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/feature/presentation/view/skillpage/skill_widget.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LEFT: Platform Items in GridView (Containers)
              Expanded(
                flex: 1,
                child: GridView.builder(
                  itemCount: platformItems.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    final item = platformItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: CusColor.kBlack400,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromARGB(26, 1, 0, 0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            item["svg"],
                            color: CusColor.white,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item["title"],
                              style: TextStyle(
                                color: CusColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 30),

              // RIGHT: Skill Chips
              Expanded(
                flex: 2,
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (var item in skillItems)
                      Chip(
                        backgroundColor: CusColor.kBlack200,
                        avatar: SvgPicture.asset(item["svg"], width: 20, height: 20),
                        label: Text(
                          item["title"],
                          style: TextStyle(color: CusColor.white),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
