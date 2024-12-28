import 'package:flutter/material.dart';
import 'package:flutter_utils/sisitech_themes/theme_controller.dart';
import 'package:flutter_utils/sisitech_themes/theme_picker.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40.0),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Ola 👋🏽'),
      ),
    );
  }
}

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
                  color: Get.theme.colorScheme.inverseSurface,
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/robo.png'),
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
