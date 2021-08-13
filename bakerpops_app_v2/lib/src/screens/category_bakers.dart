import '../commons/colours.dart';
import '../widgets/bakers.dart';
import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../models/categories.dart';

class CategoryBaker extends StatefulWidget {
  final Category categories;
  const CategoryBaker({
    required this.categories,
  });

  @override
  _CategoryBakerState createState() => _CategoryBakerState();
}

class _CategoryBakerState extends State<CategoryBaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'Welcome to BakerPops...!!!!',
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: grey,
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Find your HomeBaker",
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: Icon(Icons.filter_list),
                ),
              ),
            ),
            Baker(id: widget.categories.id),
          ],
        ),
      ),
    );
  }
}
