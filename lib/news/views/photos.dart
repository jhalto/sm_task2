import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_task2/news/controllers/photo_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Photos extends GetView<PhotoController> {
  Photos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (controller.photoList.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "${controller.photoList[index].id}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 200,
                                      color: Colors.black12.withOpacity(.10),
                                      width: double.infinity,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${controller.photoList[index].url}",
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error, size: 50),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Title: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 15,
                                          child: Text(
                                              "${controller.photoList[index].title}")),
                                    ],
                                  )
                                ],
                              ),
                              Positioned(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Colors.black12,
                                  height: 100,
                                  width: 100,
                                  child: CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        Center(
                                      child: Icon(Icons.error_outline),
                                    ),
                                    imageUrl:
                                        "${controller.photoList[index].thumbnailUrl}",
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
