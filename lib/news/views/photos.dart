import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task2/news/controllers/photo_controller.dart';


class Photos extends GetView<PhotoController>{
  Photos({super.key});
  @override
  Widget build(BuildContext context) {
   
     return Scaffold(
       body: Column(
         children: [
           Expanded(
             child: FutureBuilder(
                 future: controller.getData(),
                 builder: (context, snapshot) {
                     if(snapshot.hasData && controller.photoList.isNotEmpty){
                     return ListView.builder(itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           height: 200,
                           decoration: BoxDecoration(
                             color: Colors.red,
                             
                           ),
                           child: Image.network("${controller.photoList[index].thumbnailUrl}"),
                         ),
                       );
                     },);
                   }else if(snapshot.connectionState == ConnectionState.waiting){

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                   }else{
                       return Center(
                         child: Text("No data"),
                       );
                     }
                 },),
           )
         ],
       ),
     );
  }
}