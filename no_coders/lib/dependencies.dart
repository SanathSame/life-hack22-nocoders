import 'package:get/get.dart';
import 'package:no_coders/controllers/options_controller.dart';
import 'package:no_coders/image_controller.dart';

Future<void> init() async {
  Get.put(ImageController());
  Get.put(OptionsController());
}
