import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final List<DrawerModel> _drawerModel = <DrawerModel>[
    DrawerModel(title: 'Shop', url: 'shop'),
    DrawerModel(title: 'Profile', url: 'profile'),
    DrawerModel(title: 'Login', url: 'login'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: _drawerModel
            .map((f) => InkWell(
                  child: Text(f.title!),
                  onTap: () => debugPrint(f.url),
                ))
            .toList(),
      ),
    );
  }
}

class DrawerModel {
  final String? title;
  final String? url;

  DrawerModel({this.title, this.url});
}
