import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../../models/Photo.dart';




class PhotoController extends GetxController{
  @override

  var photoList = <Photo>[].obs;
  Future<List<Photo>> getData()async{
    String url = "https://jsonplaceholder.typicode.com/photos";

      var response = await http.get(Uri.parse(url));
      var responseData = jsonDecode(response.body.toString());
      print(response.statusCode);
      print(responseData);
      if (response.statusCode == 200) {
        for(Map i in responseData){
          photoList.add(Photo.fromJson(i));
        }
        return photoList;
      } else {
        return photoList;
      }

  }

}