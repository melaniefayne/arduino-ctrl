import 'package:arduino_ctrl/components/action_button.dart';
import 'package:arduino_ctrl/components/drawer.dart';
import 'package:arduino_ctrl/components/joystick.dart';
import 'package:arduino_ctrl/home/home_controlller.dart';
import 'package:arduino_ctrl/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var homeCtrl = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        centerTitle: true,
        title: Obx(() => Text(homeCtrl.actionTitle.value)),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: JoyStickWidget(
                bgColor: colorScheme.primaryContainer,
                fgColor: colorScheme.onPrimaryContainer,
                onDragFunction: (details) {
                  homeCtrl.updateActionTitle('Movement',
                      '${details.x.toStringAsFixed(1)}, ${details.y.toStringAsFixed(1)}');
                },
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: JoyStickWidget(
                bgColor: colorScheme.tertiaryContainer,
                fgColor: colorScheme.onTertiaryContainer,
                onDragFunction: (details) {
                  homeCtrl.updateActionTitle('Actuator',
                      '${details.x.toStringAsFixed(1)}, ${details.y.toStringAsFixed(1)}');
                },
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  homeCtrl.updateActionTitle('View', 'Coming Soon :)');
                },
                child: const Center(
                  child: Icon(Icons.zoom_out_map, size: 40),
                ),
              ),
            ),
            const Positioned(
              bottom: 5,
              left: 140,
              child: ActionButtonsWidget(),
            ),
            const Positioned(
              bottom: 5,
              right: 140,
              child: ActionButtonsWidget(mode: ActionMode.shapes),
            ),
          ],
        ),
      ),
    );
  }
}
