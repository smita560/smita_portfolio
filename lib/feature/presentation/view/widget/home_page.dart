import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/config/cusformfield.dart';
import 'package:smita_portfolio/config/size.dart';
import 'package:smita_portfolio/feature/presentation/view/skillpage/skill_mobile.dart';
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
  Widget _buildSimpleCard(String title, String time,String subtext) {
  return Container(
    width: 120,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        Text(subtext, style: TextStyle(color: Colors.white70)),
        Text(time, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}



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
            Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 60),
          width: double.maxFinite,
          color:CusColor.kBlack100,
          child: Column(
           children: [
         Text("What I  can do  ", style: TextStyle(
         color: CusColor.white,
       fontSize: 20,
       fontWeight: FontWeight.w600
       ),),
       SizedBox(height: 20,),
         if(constraints.maxWidth>=kMedDesktopwidth)   
            SkillPage()
            else 
            SkillMobile() , 
            ]),
            )  ,  
        Container(
          height: 500,
          width: double.maxFinite,
          color: CusColor.kBlack200,
        ),
        //contact
        Container(
         padding: EdgeInsets.fromLTRB(25, 25, 25, 60),
          color:CusColor.kBlack400,
          child: Column(
            children: [
              Text("Get in touch", style: TextStyle(
                color: CusColor.white,
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Flexible(
                    child: CusFormField(hinttext: 'Enter your  name',
                        bordercolor: CusColor.black,
                    controller: TextEditingController()
                    ),
                  ),
                  SizedBox(width: 10,),
                  Flexible(
                    child: CusFormField(hinttext: 'Enter your email',
                     bordercolor: CusColor.black,
                      controller: TextEditingController()
                      ),
                  ),
                ],
              ),
                     SizedBox(height: 30,),
            CusFormField(hinttext: 'Enter your Message',
             bordercolor: CusColor.black,
              controller: TextEditingController(),
              maxLines: 5,
              ),
               SizedBox(height: 20,),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                        backgroundColor: CusColor.kY600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                  onPressed: (){
                
                }, child: Text("Get in touch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: CusColor.kBlack1000),)),
              ),
              SizedBox(height: 20,),
             SizedBox(height: 20),
SizedBox(
  height: 220,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildSimpleCard("Team A", "4:00 AM","hlo"),
              _buildSimpleCard("Team B", "5:00 AM","hi"),
              _buildSimpleCard("Team C", "6:00 AM","hey"),
            ],
          ),
        ],
      ),
      Divider(),
      const SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tomorrow",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildSimpleCard("Team D", "7:00 AM","hello"),
              _buildSimpleCard("Team E", "8:00 AM","hi"),
              _buildSimpleCard("Team F", "9:00 AM","hey"),
              _buildSimpleCard("Team F", "9:00 AM","hey"),
            ],
          ),
        ],
      ),
    ],
  ),
)

            ],
          ),
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
          )
          
        );
      }
    );
  }
}



