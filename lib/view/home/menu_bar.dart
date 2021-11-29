import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/assets.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/model/data_model/menu_item.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: const BoxDecoration(color: AppColors.menubarColor),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          MenuItem item = menuItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              child: Image.asset(
                item.imagePath,
                color: AppColors.menuitemColor,
                width: 40,
                height: 40,
              ),
            ),
          );
        },
      ),
    );
  }

  final List menuItems = const [
    MenuItem(name: 'jar', imagePath: Assets.jar),
    MenuItem(name: 'jam', imagePath: Assets.jam),
    MenuItem(name: 'cap', imagePath: Assets.cap),
    MenuItem(name: 'coffee', imagePath: Assets.coffee),
    MenuItem(name: 'cake', imagePath: Assets.cake),
    MenuItem(name: 'champagne', imagePath: Assets.champagne),
  ];
}
