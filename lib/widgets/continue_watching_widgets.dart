import 'package:flutter/material.dart';

import 'common_widgets.dart';


class ContinueWatchingWidget extends StatelessWidget {
  const ContinueWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 151,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 103,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                   ),
                child: Column(
                  children: [
                    Container(

                      height: 98,
                      decoration: BoxDecoration(


                        image: DecorationImage(image: AssetImage("lib/images/continue1.png"),fit: BoxFit.fill)
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 5,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                        ),
                        overlayShape: SliderComponentShape.noOverlay
                      ),
                      child: Slider(
                        activeColor: Colors.red,
                        thumbColor: Colors.transparent,
                        max: 100,
                        min: 0,
                        value: 60,
                        onChanged: (value) {

                      },),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 167,
                child: Text("Wednesday | Season - 1 | Episodes - 3",maxLines: 2,style: appStyleAkatab(14, white),),
              )
            ],
          )),
          SizedBox(width: 15,),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 103,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(

                          height: 98,
                          decoration: BoxDecoration(


                              image: DecorationImage(image: AssetImage("lib/images/continue2.png"),fit: BoxFit.fill)
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              trackHeight: 5,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 0,
                              ),
                              overlayShape: SliderComponentShape.noOverlay
                          ),
                          child: Slider(
                            activeColor: Colors.red,
                            thumbColor: Colors.transparent,
                            max: 100,
                            min: 0,
                            value: 90,
                            onChanged: (value) {

                            },),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 167,
                    child: Text("Emily In Paris | Season - 1 | Episodes - 1",maxLines: 2,style: appStyleAkatab(14, white),),
                  )
                ],
              )),

        ],
      ),
    );
  }
}
