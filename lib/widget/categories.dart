import 'package:shopping/helpers/helper.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Widget> myCategoriesItems= [];

  @override
  Widget build(BuildContext context) {
    state(context).categories.forEach((f) {
      myCategoriesItems.add(SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(f.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: f.items.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    image: f.items[index].image,
                    title: f.items[index].title,
                  );
                },
              ),
            )
          ],
        ),
      ));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: myCategoriesItems,
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, this.image, this.title, this.tag});

  final String? image;
  final String? title;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(image!), fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.0),
              ])),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
      ),
    );
  }
}
