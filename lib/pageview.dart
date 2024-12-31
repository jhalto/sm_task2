import 'package:flutter/material.dart';
import 'package:sm_task2/home.dart';
import 'package:sm_task2/modules/news/views/photos.dart';

class PageviewDemo extends StatefulWidget {
  const PageviewDemo({super.key});

  @override
  State<PageviewDemo> createState() => _PageviewDemoState();
}

class _PageviewDemoState extends State<PageviewDemo> {
  PageController? pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController?.dispose(); // Dispose of the controller to free resources
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                currentIndex = value;
              }, // Update current index on swipe
              children: [
                Home(),
                Photos(),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
