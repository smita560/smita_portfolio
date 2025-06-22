class ProjectUtils {
  final  String image;
  final String title;
  final String description;
  final String?  andriodLink;
  final String? webLink;
  final String? iosLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.description,
    this.andriodLink,
    this.webLink,
    this.iosLink,
  });

  
}

List <ProjectUtils> workproject = [
  ProjectUtils(
    image: 'assets/images/portfolio.png',
    title: 'Portfolio',
    description: 'A personal portfolio website to showcase my skills and projects.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.portfolio',
    webLink: 'https://example.com/portfolio',
    iosLink: 'https://apps.apple.com/app/portfolio/id1234567890',
  ),
  ProjectUtils(
    image: 'assets/images/chat_app.png',
    title: 'Chat App',
    description: 'A real-time chat application with user authentication.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.chatapp',
    webLink: 'https://example.com/chatapp',
    iosLink: 'https://apps.apple.com/app/chat-app/id1234567891',
  ),
];

 List <ProjectUtils> hobbyProject = [
  ProjectUtils(
    image: 'assets/images/food_delivery.png',
    title: 'Food Delivery App',
    description: 'An app for ordering food from local restaurants.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.fooddelivery',
    webLink: 'https://example.com/fooddelivery',
    iosLink: 'https://apps.apple.com/app/food-delivery/id1234567892',
  ),
  ProjectUtils(
    image: 'assets/images/ecommerce_app.png',
    title: 'E-commerce App',
    description: 'A complete e-commerce solution with payment integration.',
    andriodLink: 'https://play.google.com/store/apps/details?id=com.example.ecommerceapp',
    webLink: 'https://example.com/ecommerceapp',
    iosLink: 'https://apps.apple.com/app/e-commerce-app/id1234567893',
  ),
 ];