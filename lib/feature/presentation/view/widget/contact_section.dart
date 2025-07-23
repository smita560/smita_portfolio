import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
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
  bool _isSending = false;
  bool get isSending => _isSending;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  Future<bool> sendMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    _isSending = true;
    // notifyListeners();

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      //This function is used to send email
      final responseToMe = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({ 
          "service_id": "service_g39khc7", 
          "template_id": "template_bi5ampf",
          "user_id": "ZZe80oCmRq2X_5m9A",
          "template_params": {
            "name": name,
            "email": email,
            "message": message,
                                 
          },
        }),
      );

      //make sure this template_params should match with your template
        
       //If you needed create function for acknowledge also

      _isSending = false;
      // notifyListeners();

      return responseToMe.statusCode == 200 ;
          
    } catch (e) {
      _isSending = false;
      // notifyListeners();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return  Container(
         padding: EdgeInsets.fromLTRB(25, 25, 25, 60),
          color:CusColor.kBlack400,
          child: Form(
            key: _formKey,
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
                controller: messageController,
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
                  
                  }, child: GestureDetector(
                       onTap: () async {
  final success = await sendMessage(
    name: nameController.text,
    email: emailController.text,
    message: messageController.text,
  );

  final snackBar = SnackBar(
    content: Text(success
        ? 'Message sent successfully!'
        : 'Failed to send the message.'),
    backgroundColor: success ? Colors.green : Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
},

                        
                    child: Text("Get in touch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: CusColor.kBlack1000),))),
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
                child: SvgPicture.asset('assets/project/github.svg',height: 32,color: CusColor.kBlack1000,),),
                  InkWell(
                   
                    onTap:(){ js.context.callMethod('open',[Applinks.facebook]);} , child: SvgPicture.asset('assets/project/facebook.svg',height: 32,color: CusColor.kBlack1000,)),  
                   InkWell( onTap: (){ js.context.callMethod('open',[Applinks.instagram]);},
                    child:  SvgPicture.asset('assets/project/instagram.svg',height: 32,color: CusColor.kBlack1000,)),
                      InkWell(
                        onTap: (){ js.context.callMethod('open',[Applinks.linkedin,]);},
                         child:  SvgPicture.asset('assets/project/linkdin.svg',height: 32,color: CusColor.kBlack1000,))
                ]  )
            
              ],
            ),
          ),
        );
  }
  Row buildnameEmailFieldDesktop(){
    return  Row(
                  children: [
                    Flexible(
                      child: CusFormField(hinttext: 'Enter your  name',
                          bordercolor: CusColor.black,
                      controller: nameController
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
                      controller: nameController
                      ),
                    ),
                    SizedBox(height: 15,),
                    Flexible(
                      child: CusFormField(hinttext: 'Enter your email',
                       bordercolor: CusColor.black,
                        controller: emailController
                        ),
                    ),
                  ],
                );
   }
}