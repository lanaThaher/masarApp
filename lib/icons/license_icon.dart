import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({ super.key,
                      required this.colorOne,
                      required this.colorTwo,  
                      required this.rectangleSize, 
                      required this.iconSize, 
                      required this.topPadding, 
                      required this.startPaddingOne,
                      required this.startPaddingTwo, 
                      required this.iconName
                    });

  final Color colorOne;
  final Color colorTwo;
  final double rectangleSize; 
  final double iconSize;
  final double topPadding;
  final double startPaddingOne;
  final double startPaddingTwo;
  final IconData iconName;


  Widget licenseIcon () {
    return Stack(
      children: [
        Icon(iconName, color: colorOne, size: rectangleSize),
        Padding(
          padding: EdgeInsetsDirectional.only(top: topPadding, start: startPaddingOne),
          child: Icon(Icons.person, color: colorTwo, size: iconSize,),
          ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: topPadding, start: startPaddingTwo,),
          child: Icon(Icons.menu, color: colorTwo, size: iconSize,),
          ),
      ]
    );
}


  @override
  Widget build(BuildContext context) {
    return licenseIcon();
  }
} 



  