import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class JoyStickWidget extends StatelessWidget {
  final Color bgColor;
  final Color fgColor;
  final void Function(StickDragDetails)? onDragFunction;

  const JoyStickWidget({
    super.key,
    required this.bgColor,
    required this.fgColor,
    this.onDragFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Joystick(
        includeInitialAnimation: false,
        base: JoystickBase(
          decoration: JoystickBaseDecoration(color: bgColor),
          arrowsDecoration: JoystickArrowsDecoration(
            color: fgColor,
            enableAnimation: false,
          ),
        ),
        stick: JoystickStick(
          size: 50,
          decoration: JoystickStickDecoration(
            color: fgColor,
            shadowColor: fgColor.withOpacity(0.5),
          ),
        ),
        listener: onDragFunction ??
            (details) {
              debugPrint("${details.x}, ${details.y}");
            },
      ),
    );
  }
}
