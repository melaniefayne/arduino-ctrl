import 'package:arduino_ctrl/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString actionTitle = ''.obs;

  updateActionTitle(String src, String title) {
    actionTitle.value = "$src: $title";
  }

  handleActionBtn(ActionMode mode, ActionType type) {
    String src = mode == ActionMode.direction ? 'Direction' : 'Shapes';
    actionTitle.value = "$src: ${type.name.toString()}";
  }
}
