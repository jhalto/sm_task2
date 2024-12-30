import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task2/news/controllers/photo_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';


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
                         padding: const EdgeInsets.all(16.0),
                         child: Stack(
                           children: [

                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Align(
                                     alignment: Alignment.topRight,
                                     child: Text("${controller.photoList[index].id}")),
                                 ClipRRect(
                                   borderRadius: BorderRadius.circular(10),
                                   child: Container(
                                     height: 200,
                                     
                                     width: double.infinity,
                                     
                                     child: CachedNetworkImage(
                                         imageUrl: "${controller.photoList[index].url}",
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                         fit: BoxFit.fill,
                                     ),
                                   ),
                                 ),

                                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.baseline,
                                   textBaseline: TextBaseline.alphabetic,
                                   children: [
                                     Expanded(
                                         flex:2,
                                         child: Text("Title: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                     Expanded(
                                         flex: 15,
                                         child: Text("${controller.photoList[index].title}")),
                                   ],
                                 )


                               ],
                             ),
                             Positioned(

                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Container(

                                   height: 100,
                                   width: 100,
                                   child: CachedNetworkImage(
                                       imageUrl: "${controller.photoList[index].thumbnailUrl}",
                                     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                   ),
                                 ),
                               )
                             ),
                           ],
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