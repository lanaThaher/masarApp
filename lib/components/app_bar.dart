import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';

class App_Bar extends StatelessWidget implements PreferredSizeWidget{
  const App_Bar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: kBackGroundColor,
        title: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color:Colors.grey[700]),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(250.0),
          child: Container( 
            height: 1.0,
            color: kPrimaryColor) ),
          actions: [
            Container(
              margin: const EdgeInsets.only(top:25, left: 25, right: 25),
              child:  Image.asset("assets/images/car.jpeg", 
              fit: BoxFit.fill, )), ],
            iconTheme: const IconThemeData(color: kPrimaryColor ),
      );}
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}