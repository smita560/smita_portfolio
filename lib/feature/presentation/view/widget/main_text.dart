import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';

class MainText extends StatelessWidget {
  const MainText({
    super.key,
  });

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
                      child: Image.asset('assets/project/smita.jpeg',height: 200,width: 200,)
          ), 
          SizedBox(height: 30,),
              Text("Hi,\nI'm smita Karki \n A Flutter Developer",
              style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold
              ,color: CusColor.kBlack1000),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
          backgroundColor: CusColor.kY600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                ),
                onPressed: (){}, child: Text("Get in touch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: CusColor.kBlack1000),))
                    
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

