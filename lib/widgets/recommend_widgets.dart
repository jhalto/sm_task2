import 'package:flutter/material.dart';

import 'common_widgets.dart';

class RecommendWidgets extends StatelessWidget {
  RecommendWidgets({super.key});

  final List<String> objectList = [
    "lib/images/recommend1.png",
    "lib/images/recommend2.png",
    "lib/images/recommend3.png",
    "lib/images/recommend4.png",
  ];
   final List<String> objectName = [
     "Double Love",
     "Curse Of The River",
     "Sunita",
      "Pokoman: Detective",
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
                Text(objectName[index],style: appStyle(14,white),)
              ],
            ),
          );
        },

      ),
    );
  }
}
