import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart' show CusColor;

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hi,\nI'm smita Karki \n A Flutter Developer",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: CusColor.kBlack1000),),
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
          Image.asset('assets/img/smita.png',
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

