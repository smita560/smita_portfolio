import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/config/cusformfield.dart';
import 'dart:js'as js;

import 'package:smita_portfolio/constant/s.s_links.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/hover_widget.dart';

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

String ?validateName(String?value){
  if(value ==null || value.isEmpty){
    return "Name is required";
  }
  return null;
}
String ?validateEmail(String?value){
  if(value ==null || value.isEmpty){
    return "Email is required";
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if(!emailRegex.hasMatch(value)){
    return "Please enter a valid email address";
  }
  return null;
}


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
      _isSending = false;

      return responseToMe.statusCode == 200 ;
          
    } catch (e) {
      _isSending = false;
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
            
              SizedBox(height: 30,),
              CusFormField(hinttext: 'Enter your  name',
                          bordercolor: CusColor.black,
                      controller: nameController,
                      validator: validateName,
                    
                      ),
                       SizedBox(height: 20,),
                      CusFormField(hinttext: 'Enter your email',
                       bordercolor: CusColor.black,
                        controller: TextEditingController(),
                        validator: validateEmail,
                        ),
                         SizedBox(height: 20,),
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
                          backgroundColor: CusColor.kR800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                    onPressed: () async {
                      if(_formKey.currentState?.validate() ?? false) {
                         
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
                        }
                  
                  }, child: Text("Submit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: CusColor.kBlack1000),)),
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
              children: const [
                HoverIcon(
                  assetPath: 'assets/project/github.svg',
                  url: Applinks.github,
                  color: CusColor.kBlack1000,
                ),
                HoverIcon(
                  assetPath: 'assets/project/facebook.svg',
                  url: Applinks.facebook,
                  color: CusColor.kBlack1000,
                ),
                HoverIcon(
                  assetPath: 'assets/project/instagram.svg',
                  url: Applinks.instagram,
                  color: CusColor.kBlack1000,
                ),
                HoverIcon(
                  assetPath: 'assets/project/linkdin.svg',
                  url: Applinks.linkedin,
                  color: CusColor.kBlack1000,
                ),
            
              ],
            ),
           ] )
          ),
        );
  }
  Row buildnameEmailFieldDesktop(){
    return  Row(
                  children: [
                    Flexible(
                      child: CusFormField(hinttext: 'Enter your  name',
                          bordercolor: CusColor.black,
                      controller: nameController,
                      validator: validateName,
                    
                      ),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: CusFormField(hinttext: 'Enter your email',
                       bordercolor: CusColor.black,
                        controller: TextEditingController(),
                        validator: validateEmail,
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
                      controller: nameController,
                      validator: validateName,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Flexible(
                      child: CusFormField(hinttext: 'Enter your email',
                       bordercolor: CusColor.black,
                        controller: emailController,
                        validator: validateEmail,
                        ),
                    ),
                  ],
                );
   }
}