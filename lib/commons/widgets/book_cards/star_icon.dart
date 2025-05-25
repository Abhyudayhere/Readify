import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ToggleStarIcon extends StatefulWidget {
  const ToggleStarIcon({super.key, this.size = 20.0});
  final double size;

  @override
  State<ToggleStarIcon> createState() => _ToggleStarIconState();
}

class _ToggleStarIconState extends State<ToggleStarIcon> {
  final storage = GetStorage();
  RxBool isStarred = true.obs;

  @override
  void initState() {
    super.initState();
    GetStorage.init(); // Safe to call multiple times
    if (!storage.hasData('isStarred')) {
      storage.write('isStarred', true);
    }
    isStarred.value = storage.read('isStarred') ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () {
        isStarred.value = !isStarred.value;
        storage.write('isStarred', isStarred.value);
      },
      child: Icon(
        isStarred.value
            ? FontAwesomeIcons.solidStar
            : FontAwesomeIcons.star,
        color: Colors.yellow,
        size: widget.size,
      ),
    ));
  }
}
