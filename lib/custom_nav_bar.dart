import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/common_widgets.dart';


class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex= 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          color: Color(0xff1C212A),
          borderRadius: BorderRadius.circular(41),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                child: Icon(Icons.home_filled, size: 28,color: currentIndex == 0? Colors.red:iBC,),
              onTap: (){
                  setState(() {
                    currentIndex = 0;
                  });
              },
            ),
            GestureDetector(
                child: Icon(Icons.monitor,size:  28,color: currentIndex == 1? Colors.red:iBC,),
              onTap: (){
                  setState(() {
                    currentIndex = 1;
                  });
              },
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  currentIndex = 2;
                });
              },
                child: Icon(CupertinoIcons.arrow_down_to_line_alt,size: 28,color: currentIndex == 2? Colors.red:iBC,)),
            GestureDetector(
                child: Icon(CupertinoIcons.person,size: 28,color: currentIndex == 3? Colors.red:iBC,),
              onTap: (){
                  setState(() {
                    currentIndex = 3;
                  });
              },
            ),
          ],
        ),
      ),
    );
  }
}
