import 'package:flutter/material.dart';

import 'common_widgets.dart';


class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                currentIndex = 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                color: currentIndex ==0?Colors.red:cBC,
              ),
              height: 34,

              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Center(child: Text("All",style: appStyleAkatab(14,currentIndex==0?white: cNST),)),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                currentIndex = 1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: currentIndex ==1?Colors.red:cBC,
              ),
              height: 34,

              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Center(child: Text("Action",style: appStyleAkatab(14,currentIndex==1?white: cNST),)),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                currentIndex = 2;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                color: currentIndex ==2?Colors.red:cBC,
              ),
              height: 34,

              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Center(child: Text("Anime",style: appStyleAkatab(14,currentIndex==2?white: cNST),)),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                currentIndex = 3;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                color: currentIndex ==3?Colors.red:cBC,
              ),
              height: 34,

              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Center(child: Text("Sci-fi",style: appStyleAkatab(14,currentIndex==3?white: cNST),)),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                currentIndex = 4;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                color: currentIndex ==4?Colors.red:cBC,

              ),
              height: 34,

              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Center(child: Text("Thriller",style: appStyleAkatab(14,currentIndex==4?white: cNST),)),
            ),
          ),


        ],
      ),
    );
  }
}
