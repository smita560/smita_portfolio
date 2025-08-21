import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';

class MainText extends StatefulWidget {
  const MainText({super.key});

  @override
  State<MainText> createState() => _MainTextState();
}

class _MainTextState extends State<MainText> with SingleTickerProviderStateMixin {
   late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // animate up and down continuously

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.2), // more visible vertical movement
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        ConstrainedBox(
          constraints:BoxConstraints(maxWidth:700) ,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                height: 50,
                constraints: BoxConstraints(
                  minHeight: 560,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [CusColor.kBlack100.withOpacity(0.6), CusColor.kBlack100.withOpacity(0.6)],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                         child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
                        child: Image.asset('assets/project/smita.jpeg',height: 200,width: 200,
                        fit: BoxFit.cover,
                        ),)
          ), 
                    ),
          SizedBox(height: 30,),
            SlideTransition(
                  position: _animation,  
                child: Text("Hi,\nI'm smita Karki \n A Flutter Developer",
                style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold
                ,color: CusColor.kBlack1000),),
              ),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CusColor.kR800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              ),
              onPressed: () {},
              child: Text(
                "Get in touch",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CusColor.kBlack1000,
                ),
              ),
                            )
                    
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
  
}