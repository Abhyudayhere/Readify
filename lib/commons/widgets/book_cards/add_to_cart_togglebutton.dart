import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class ToggleIconButton extends StatefulWidget {
  const ToggleIconButton({super.key});

  @override
  State<ToggleIconButton> createState() => _ToggleIconButtonState();
}

class _ToggleIconButtonState extends State<ToggleIconButton> {
  final storage = GetStorage();
  RxBool isAdd = true.obs;

  @override
  void initState() {
    super.initState();
    if (!GetStorage().hasData('isAdd')) {
      storage.write('isAdd', true); // default value
    }
    isAdd.value = storage.read('isAdd') ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () {
        isAdd.value = !isAdd.value;
        storage.write('isAdd', isAdd.value);
      },
      child: Icon(
        isAdd.value ? Iconsax.add : Iconsax.trash,
        color: Colors.white,
      ),
    ));
  }
}
