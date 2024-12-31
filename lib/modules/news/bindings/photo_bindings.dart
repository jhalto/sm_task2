import 'package:get/get.dart';

import '../controllers/photo_controller.dart';


class PhotoBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(PhotoController());
  }
}