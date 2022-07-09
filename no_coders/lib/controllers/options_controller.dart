import 'package:get/get_state_manager/get_state_manager.dart';

class OptionsController extends GetxController {
  String currentSelection = "";

  void changeSelection(String category) {
    currentSelection = category;
    update();
  }
}
