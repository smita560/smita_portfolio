import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/hover_widget.dart';
import 'package:smita_portfolio/utils/project_doc_panel.dart';
import 'package:smita_portfolio/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});
  final ProjectUtils project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3), // start slightly below
      end: Offset.zero, // slide to original position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Delay the start of the animation slightly
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return GestureDetector(
      onTap: () {
    if (project.docContent != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectDocPanel(
            title: project.title,
            docContent: project.docContent!,
            screenshots: [
              project.screenshots??'',
        
            ],
          ),
        ),
      );
    }
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 400,
        width: 350,
        decoration: BoxDecoration(
          color: CusColor.kBlack500,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.asset(
              project.img,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
      
            // Title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 6),
              child: Text(
                project.title,
                style: TextStyle(
                  color: CusColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
      
            // Animated Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: child,
                  ),
                ),
                child: Text(
                  project.description,
                  style: TextStyle(
                    color: CusColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
      
            const Spacer(),
      
            // Footer with Icons
            Container(
              color: CusColor.kBlack600,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Available on ",
                    style: TextStyle(
                      color: CusColor.kY600,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (project.iosLink != null)
                  HoverIcon(
                    assetPath:'assets/project/apple-brands-solid.svg',
                    url: project.iosLink??'',
                    color: CusColor.kBlack1000,
                  ),
                  const SizedBox(width: 10),
                  if (project.andriodLink != null)
                  HoverIcon(
                    assetPath:'assets/project/android-brands-solid.svg',
                    url: project.andriodLink??'',
                    color: CusColor.kBlack1000,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
