import 'package:shopping/Animation/fade_animation.dart';

import 'package:shopping/widget/categories.dart';
import 'package:shopping/widget/drawer_menu.dart';
import 'package:shopping/widget/main_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String get routeName => '@routes/home-page';
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FadeAnimation> _appBarActions = [
    FadeAnimation(
        1.2,
        IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white), onPressed: () {})),
    FadeAnimation(
        1.3,
        IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {})),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.transparent,
              actions: _appBarActions,
              iconTheme: const IconThemeData(color: Colors.white),
              expandedHeight: 500,
              flexibleSpace: const FlexibleSpaceBar(
                background: MainImage(),
              )),
          SliverList(
            delegate: SliverChildListDelegate([
              const Categories(),
              const Categories(),
              const Categories(),
            ]),
          )
        ],
      ),
    );
  }
}
