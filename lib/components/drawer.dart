import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_utils/sisitech_themes/theme_controller.dart';
import 'package:flutter_utils/sisitech_themes/theme_picker.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) => Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('AutoBots, Roll Out!'),
              accountEmail: const Text(''),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/robo.svg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Switch Theme'),
              onTap: () {
                Get.to(() => SistchThemePicker());
              },
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  'Arduino Controller © ${DateTime.now().year}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
