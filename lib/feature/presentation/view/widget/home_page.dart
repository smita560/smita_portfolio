import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/config/size.dart';
import 'package:smita_portfolio/constant/links.dart';
import 'package:smita_portfolio/feature/presentation/view/project/project_section.dart';
import 'package:smita_portfolio/feature/presentation/view/skillpage/skill_mobile.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/contact_section.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/drawer_widget.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/header_deskboard_widget.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/header_mobile_widget.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/main_desktop.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/main_text.dart';
import 'package:smita_portfolio/feature/presentation/view/skillpage/skill_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CusColor.kBlack200,
          endDrawer:
              constraints.maxWidth < kMinDesktopwidth
                  ? DrawerWidget(
                    onNavItemtap: (int navIndex) {
                      scaffoldKey.currentState?.closeEndDrawer();
                      scrollToSection(navIndex);
                    },
                  )
                  : null,
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                if (constraints.maxWidth >= kMinDesktopwidth)
                  HeaderDeskboard(
                    onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    },
                  )
                else
                  HeaderMobileWidget(
                    onLogoTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                if (constraints.maxWidth >= kMinDesktopwidth)
                  MainDesktop()
                else
                  MainText(),
                Container(
                  key: navbarKeys[1],

                  padding: EdgeInsets.fromLTRB(25, 25, 25, 60),
                  width: double.maxFinite,
                  color: CusColor.kBlack100,
                  child: Column(
                    children: [
                      Text(
                        "What I  can do  ",
                        style: TextStyle(
                          color: CusColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      if (constraints.maxWidth >= kMinDesktopwidth)
                        SkillPage()
                      else
                        SkillMobile(),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ProjectSection(key: navbarKeys[2]),
                //contact
                ContactSection(key: navbarKeys[3]),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: Text(
                    "Made by Smita Karki with Flutter ",
                    style: TextStyle(
                      color: CusColor.kBlack500,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // js.context.callMethod('open',[Applinks.blog]);
      return;
    }
    final key = navbarKeys[navIndex];

    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
