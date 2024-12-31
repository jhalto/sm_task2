import 'package:flutter/material.dart';

import 'common_widgets.dart';


class SearchBarStyle extends StatelessWidget {
  const SearchBarStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 43,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xff888A8F),
            ),
            borderRadius: BorderRadius.circular(35)
          ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
      
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search",style: appStyleAkatab(14,white.withOpacity(.50)),),
              Icon(Icons.search_rounded,color: white.withOpacity(.50),),
            ],
          ),
        ),
      ),
    );
  }
}
