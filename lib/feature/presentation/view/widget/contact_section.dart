import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/config/cusformfield.dart';
import 'package:smita_portfolio/config/size.dart';
import 'dart:js'as js;

import 'package:smita_portfolio/constant/s.s_links.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 100,maxWidth: 700),
                child: LayoutBuilder(builder: (context,constraints){
if(constraints.maxWidth>=kMinDesktopwidth){
  return buildnameEmailFieldDesktop();
}
return buildnameEmailFieldMobile();
                }
                
              ),
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
              SizedBox(height: 30,),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 700),
                child: Divider()),
              SizedBox(height: 15,),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
             InkWell(
              onTap: (){
                js.context.callMethod('open',[Applinks.github]);
              },
              child: Icon(Icons.gite,weight: 32)),
                InkWell(
                 
                  onTap:(){ js.context.callMethod('open',[Applinks.facebook]);} , child: Icon(Icons.facebook,weight: 32,)),  
                 InkWell( onTap: (){ js.context.callMethod('open',[Applinks.instagram]);},
                  child: Icon(Icons.install_desktop,weight: 32)),
                    InkWell(
                      onTap: (){ js.context.callMethod('open',[Applinks.linkedin]);},
                      child: Icon(Icons.link,weight: 32)),
              ],
            )

            ],
          ),
        );
  }
  Row buildnameEmailFieldDesktop(){
    return  Row(
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
                );
                
  }
   Column buildnameEmailFieldMobile(){
    return  Column(
                  children: [
                    Flexible(
                      child: CusFormField(hinttext: 'Enter your  name',
                          bordercolor: CusColor.black,
                      controller: TextEditingController()
                      ),
                    ),
                    SizedBox(height: 15,),
                    Flexible(
                      child: CusFormField(hinttext: 'Enter your email',
                       bordercolor: CusColor.black,
                        controller: TextEditingController()
                        ),
                    ),
                  ],
                );
   }
}