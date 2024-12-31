

import 'package:flutter/material.dart';

import 'common_widgets.dart';


class TrendingWidgets extends StatelessWidget {
  TrendingWidgets({super.key});

  final List<String> objectList = [
    "lib/images/trending1.png",
    "lib/images/trending2.png",
    "lib/images/trending3.png",
    "lib/images/trending4.png",
    "lib/images/trending5.png",
    "lib/images/trending6.png",
    "lib/images/trending7.png",
  ];

  final List<String> objectName = [
    "Yes I Do",
    "Soul Mate",
    "UB'S Secret",
    "UB'S Secret",
    "UB'S Secret",
    "UB'S Secret",
    "UB'S Secret",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      width: double.infinity,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: objectList.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: 10,);
        },
        itemBuilder: (context, index) {
          return Container(
            height: 164,
             width: 99 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 127,
                  width: 99,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(objectList[index]),fit: BoxFit.fill)
                  ),
                ),
                SizedBox(height: 2,),
                Text(objectName[index],style: appStyleAkatab(14,white),)
              ],
            ),
          );
        },

      ),
    );
  }
}
