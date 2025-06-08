import 'package:flutter/material.dart';
import 'package:smita_portfolio/constant/color.dart';
import 'package:smita_portfolio/constant/size.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/drawer_widget.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/header_deskboard_widget.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/header_mobile_widget.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/main_desktop.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/main_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CusColor.kBlack200,
          endDrawer:constraints.maxWidth<kMinDesktopwidth? DrawerWidget():null,
          body: ListView(
          scrollDirection: Axis.vertical,
            children: [
              if(constraints.maxWidth>=kMinDesktopwidth)
              HeaderDeskboard()
              else
              HeaderMobileWidget(
                onLogoTap: (){
                    scaffoldKey.currentState?.openEndDrawer();
                } ,
              ),
              if(constraints.maxWidth>=kMinDesktopwidth)
              MainDesktop()
              else
              MainText(),
              SizedBox(height: 30,),
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
    );
  }
}

