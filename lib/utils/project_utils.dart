import 'package:smita_portfolio/utils/samoa_info.dart';
import 'package:smita_portfolio/utils/tcmf_info.dart';
import 'package:smita_portfolio/utils/vmgd_info.dart';

class ProjectUtils {
  final  String img;
  final String title;
  final String description;
  final String?  andriodLink;
  final String? iosLink;
  final String? docContent;

  ProjectUtils({
    required this.img,
    required this.title,
    required this.description,
    this.andriodLink,
    this.iosLink,
    this. docContent,

  });

  
}

List <ProjectUtils> workproject = [
  ProjectUtils(
   img: 'assets/project/vmgd.jpeg',
    title: 'Vanuatu Meteorology and Geohazards Department(VMGD)',
    description: 'WEATHER is a real-time weather information app that provides geo-hazard alerts for earthquakes, volcanoes, and tsunami. It allows users to sign up for a climate watch newsletter and provide feedback to improve services.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.portfolio',
    iosLink: 'https://apps.apple.com/np/app/vmgd/id6738470077',
    docContent:vmgdProjectDocContent,
  ),
  ProjectUtils(
    img: 'assets/project/tcmf.png',
    title: 'Tamworth Country Music Festival (TCMF) Chat',
    description: 'Tamworth is an event booking application that helps users discover and register for events in their area. The app provides a user-friendly interface to browse different event categories and stay updated with local happenings.',
    andriodLink: ' https://play.google.com/store/apps/details?id=com.cubit.tamworth.prod',
    iosLink: 'https://apps.apple.com/us/app/tcmf-2025/id6739402780',
        docContent:tcmfProjectDocContent,
  ),
   ProjectUtils(
    img: 'assets/project/samoa.png',
    title: 'Va’aitau o Samoa',
    description: 'Samoa Meteorology is a full-featured Flutter app built to provide accurate, localized weather forecasts and alerts. I led the Flutter development — crafting a responsive, reliable, and maintainable cross-platform app with robust multi-environment support.',
    andriodLink: ' https://play.google.com/store/apps/details?id=com.cubit.samet',
    iosLink: 'https://apps.apple.com/np/app/vaaitau-o-samoa/id6746432784',
     docContent:samoaProjectDocContent,
  ),
];

 List <ProjectUtils> hobbyProject = [
  ProjectUtils(
    img: 'assets/project/tcmf.png',
    title: 'Period Tracker ',
    description: 'Period tracker helps you predict your menstrual cycle and fertile days by logging your periods and symptoms',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.fooddelivery',
    iosLink: 'https://apps.apple.com/app/food-delivery/id1234567892',
  ),
  ProjectUtils(
 img: 'assets/project/tcmf.png',
    title: 'E-commerce App',
    description: 'A complete e-commerce solution with payment integration.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.ecommerceapp',
    iosLink: 'https://apps.apple.com/app/e-commerce-app/id1234567893',
  ),
 ];
