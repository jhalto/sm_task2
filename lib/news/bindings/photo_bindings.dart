import 'package:get/get.dart';
import 'package:sm_task2/news/controllers/photo_controller.dart';

class PhotoBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(PhotoController());
  }
}