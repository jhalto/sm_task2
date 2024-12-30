import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../models/Photo.dart';
import 'package:http/http.dart'as http;
class PhotoController extends GetxController {
  bool isConnectedToInternet = false;
  StreamSubscription? _internetConnection;
  @override
  void onInit() {
   _internetConnection =  InternetConnection().onStatusChange.listen((event) {
         switch (event){
           case InternetStatus.connected:
             Get.snackbar("connected", "Connected to Internet",

             snackPosition: SnackPosition.BOTTOM,
             duration: Duration(seconds: 3)
             );
             getData();
             break;
           case InternetStatus.disconnected:
             Get.snackbar("Disconnected", "No Internet Connection",
                 snackPosition: SnackPosition.BOTTOM,
                 duration: Duration(seconds: 3)
             );
             break;

           default:
             isConnectedToInternet = false;
             break;
         }
    },);
    getData();
    super.onInit();
  }
  var photoList = <Photo>[].obs;
   @override
  void dispose(){
     _internetConnection!.cancel();
      super.dispose();
   }
  
  Future<List<Photo>> getData() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    try {

      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {

        var responseData = jsonDecode(response.body);
        photoList.value = (responseData as List)
            .map((i) => Photo.fromJson(i))
            .toList();
      }
      print("return");
      return photoList;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Error in fetching Data. Then try again.",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 10),
      );
      return photoList;

    }
  }
}