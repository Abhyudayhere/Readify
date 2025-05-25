import 'package:Readify/bindings/general.bindings.dart';
import 'package:Readify/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:Readify/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ReadifyAppTheme.lightTheme,
      darkTheme: ReadifyAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: ReadifyColors.primary, body: Center(child: CircularProgressIndicator(color: ReadifyColors.white,),),),
    );
  }
}