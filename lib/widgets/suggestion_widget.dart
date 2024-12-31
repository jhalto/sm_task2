import 'package:flutter/material.dart';

import 'common_widgets.dart';


class SuggestionWidget extends StatefulWidget {
  const SuggestionWidget({super.key});

  @override
  State<SuggestionWidget> createState() => _SuggestionWidgetState();
}

class _SuggestionWidgetState extends State<SuggestionWidget> {
  PageController ? pageController;
  int currentIndex = 0;
  @override
  void initState() {

    pageController = PageController(
      initialPage: currentIndex,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 181,
        width: double.infinity,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(14),
          color: Colors.transparent,
        ),

          child: Column(
            children: [

              Expanded(

                  child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [

                  Image.asset("lib/images/frame1.png",fit: BoxFit.fill,),
                  Image.asset("lib/images/frame2.png",fit: BoxFit.fill,),

                  Image.asset("lib/images/frame3.png",fit: BoxFit.fill,),
                ],
              )),
              SizedBox(
                height: 16,

                child: Row(

                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          pageController!.jumpToPage(0);
                          currentIndex = 0;
                        });
                      },
                      child: Icon(Icons.circle,color: currentIndex ==0?white:iBC,size: 9,),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          pageController!.jumpToPage(1);
                          currentIndex = 1;
                        });
                      },
                      child: Icon(Icons.circle,color: currentIndex ==1?white:iBC,size: 9,),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          pageController!.jumpToPage(2);
                          currentIndex = 2;
                        });
                      },
                      child: Icon(Icons.circle,color: currentIndex ==2?white:iBC,size: 9,),
                    ),
                  ],
                ),
              ),
            ],
          )

    );
  }
}
