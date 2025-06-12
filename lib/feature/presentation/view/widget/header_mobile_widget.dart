import 'package:flutter/material.dart';
import 'package:smita_portfolio/config/color.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/logo_widget.dart';

class HeaderMobileWidget extends StatefulWidget {
  final VoidCallback? onLogoTap;
final VoidCallback? onMenuTap;
  const HeaderMobileWidget({super.key, this.onLogoTap,this.onMenuTap});

  @override
  State<HeaderMobileWidget> createState() => _HeaderMobileWidgetState();
}

class _HeaderMobileWidgetState extends State<HeaderMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.black45
              ]),
              borderRadius: BorderRadius.circular(100)
            ),
            child: Row(
              children: [
                LogoWidget(
                  onTap: widget.onLogoTap,
                ),
                Spacer(),
                IconButton(onPressed: widget.onLogoTap, icon: Icon(Icons.menu,color: CusColor.white,)),
                SizedBox(width: 15,),
              ],
            ),
          );
  }
}