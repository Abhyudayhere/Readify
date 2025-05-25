import 'package:Readify/features/library/screens/Home/home.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'features/library/screens/Starred Books/starred_books.dart';
import 'features/library/screens/library/library.dart';
import 'features/personalization/screens/settings/settings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = ReadifyHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? ReadifyColors.black : Colors.white,
          indicatorColor: darkMode
              ? ReadifyColors.white.withAlpha((0.1 * 255).toInt())
              : ReadifyColors.black.withAlpha((0.1 * 255).toInt()),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.book), label: 'Library'),
            NavigationDestination(icon: Icon(Iconsax.star), label: 'Starred Books'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const LibraryScreen(),
    const StarredBooksScreen(),
    const SettingsScreen()
  ];
}
