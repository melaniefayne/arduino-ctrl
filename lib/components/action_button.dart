import 'package:arduino_ctrl/home/home_controlller.dart';
import 'package:arduino_ctrl/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<ActionButton> directionActions = [
  ActionButton(
    icon: Icons.keyboard_arrow_left,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.direction, ActionType.left);
    },
  ),
  ActionButton(
    icon: Icons.keyboard_arrow_up,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.direction, ActionType.up);
    },
  ),
  ActionButton(
    icon: Icons.keyboard_arrow_down,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.direction, ActionType.down);
    },
  ),
  ActionButton(
    icon: Icons.keyboard_arrow_right,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.direction, ActionType.right);
    },
  ),
];

List<ActionButton> shapeActions = [
  ActionButton(
    icon: Icons.crop_square,
    isDirection: false,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.shapes, ActionType.square);
    },
  ),
  ActionButton(
    icon: Icons.change_history,
    isDirection: false,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.shapes, ActionType.triangle);
    },
  ),
  ActionButton(
    icon: Icons.cancel,
    isDirection: false,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.shapes, ActionType.x);
    },
  ),
  ActionButton(
    icon: Icons.circle_outlined,
    isDirection: false,
    action: () {
      var homeCtrl = Get.find<HomeController>();
      homeCtrl.handleActionBtn(ActionMode.shapes, ActionType.circle);
    },
  ),
];

class ActionButtonsWidget extends StatelessWidget {
  final ActionMode? mode;
  const ActionButtonsWidget({
    super.key,
    this.mode = ActionMode.direction,
  });

  @override
  Widget build(BuildContext context) {
    List<ActionButton> actions =
        mode == ActionMode.direction ? directionActions : shapeActions;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        actions[0],
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            actions[1],
            const SizedBox(height: 10),
            actions[2],
          ],
        ),
        actions[3],
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final bool? isDirection;
  final void Function() action;

  const ActionButton(
      {super.key,
      required this.icon,
      required this.action,
      this.isDirection = true});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius:
              (isDirection ?? true) ? BorderRadius.circular(10) : null,
          shape: (isDirection ?? true) ? BoxShape.rectangle : BoxShape.circle,
        ),
        height: 50,
        child: Center(
          child: Icon(icon, size: 40, color: colorScheme.onPrimary),
        ),
      ),
    );
  }
}
