class ProjectUtils {
  final  String img;
  final String title;
  final String description;
  final String?  andriodLink;
  final String? webLink;
  final String? iosLink;

  ProjectUtils({
    required this.img,
    required this.title,
    required this.description,
    this.andriodLink,
    this.webLink,
    this.iosLink,
  });

  
}

List <ProjectUtils> workproject = [
  ProjectUtils(
   img: 'assets/project/vmgd.jpeg',
    title: 'Vanuatu Meteorology and Geohazards Department(VMGD) '
,
    description: 'WEATHER is a real-time weather information app that provides geo-hazard alerts for earthquakes, volcanoes, and tsunami. It allows users to sign up for a climate watch newsletter and provide feedback to improve services.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.portfolio',
    webLink: 'https://example.com/portfolio',
    iosLink: 'https://apps.apple.com/app/portfolio/id1234567890',
  ),
  ProjectUtils(
    img: 'assets/project/tcmf.png',
    title: 'Tamworth Country Music Festival (TCMF) Chat',
    description: 'Tamworth is an event booking application that helps users discover and register for events in their area. The app provides a user-friendly interface to browse different event categories and stay updated with local happenings.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.chatapp',
    webLink: 'https://example.com/chatapp',
    iosLink: 'https://apps.apple.com/app/chat-app/id1234567891',
  ),
];

 List <ProjectUtils> hobbyProject = [
  ProjectUtils(
    img: 'assets/project/tcmf.png',
    title: 'Period Tracker ',
    description: 'Period tracker helps you predict your menstrual cycle and fertile days by logging your periods and symptoms',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.fooddelivery',
    webLink: 'https://example.com/fooddelivery',
    iosLink: 'https://apps.apple.com/app/food-delivery/id1234567892',
  ),
  ProjectUtils(
 img: 'assets/project/tcmf.png',
    title: 'E-commerce App',
    description: 'A complete e-commerce solution with payment integration.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.ecommerceapp',
    webLink: 'https://example.com/ecommerceapp',
    iosLink: 'https://apps.apple.com/app/e-commerce-app/id1234567893',
  ),
 ];
