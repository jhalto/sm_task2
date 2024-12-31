import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:http/http.dart' as http;

import '../../../helper/db_helper.dart';
import '../../../models/Photo.dart';


class PhotoController extends GetxController {
  bool hasCheckedInitialConnection = false;
  StreamSubscription? _internetConnection;
  var photoList = <Photo>[].obs;

  @override
  void onInit() {
    super.onInit();
    _internetConnection = InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          if (hasCheckedInitialConnection) {
            Get.snackbar(
              "Connected",
              "Connected to Internet",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
            );
          }
          getData();
          break;

        case InternetStatus.disconnected:
          loadLocalData();
          Get.snackbar(
            "Disconnected",
            "No Internet Connection",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
          );
          break;
      }
      hasCheckedInitialConnection = true;
    });
  }

  @override
  void dispose() {
    _internetConnection?.cancel();
    super.dispose();
  }

  Future<void> getData() async {
    const String url = "https://jsonplaceholder.typicode.com/photos";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final List<Photo> photos =
            (responseData as List).map((i) => Photo.fromJson(i)).toList();
        photoList.value = photos;
        print(responseData);

        await saveDataToLocalDatabase(photos);
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Error in fetching data. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
      );
    }
  }

  Future<void> saveDataToLocalDatabase(List<Photo> photos) async {
    await DBHelper.clearPhotos();
    for (Photo photo in photos) {
      await DBHelper.createPhoto(photo);
    }
  }

  Future<void> loadLocalData() async {
    final List<Photo> localPhotos = await DBHelper.readPhoto();
    if (localPhotos.isNotEmpty) {
      photoList.value = localPhotos;
    }
    print("loading offline data");
  }
}
