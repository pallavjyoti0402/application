import '../screens/category_bakers.dart';

import '../commons/screen_navigator.dart';
import 'package:flutter/material.dart';
import '../commons/colours.dart';
import '../models/categories.dart';
import 'custom_text.dart';
import '../utils.dart/caregory_utils.dart';

// List<Category> categorieList = [
//   Category(id: '1', name: 'Birthday', image: '1.jpg'),
//   Category(id: '1', name: 'Aniversary', image: '1.jpg'),
//   Category(id: '1', name: 'Party', image: '1.jpg'),
//   Category(id: '1', name: 'Indian', image: '1.jpg'),
//   Category(id: '1', name: 'Celebration', image: '1.jpg'),
//   Category(id: '1', name: 'Birthday', image: '1.jpg'),
//   Category(id: '1', name: 'Birthday', image: '1.jpg'),
//   Category(id: '1', name: 'Birthday', image: '1.jpg'),
//   Category(id: '1', name: 'Birthday', image: '1.jpg'),
//   Category(id: '1', name: 'Birthday', image: '1.jpg'),
// ];

class Caregories extends StatelessWidget {
  final GetCategory objCategory = GetCategory();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        child: FutureBuilder(
            future: objCategory.getCategory(),
            builder:
                (BuildContext ctx, AsyncSnapshot<List<Category>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              changeScreen(
                                  _,
                                  CategoryBaker(
                                    categories: snapshot.data![index],
                                  ));
                            },
                            child: Container(
                              width: 120.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: white,
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    //"https://popstestimages.s3.ap-south-1.amazonaws.com/1.jpg",
                                    "${snapshot.data![index].image}",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          CustomText(
                            text: "${snapshot.data![index].name}",
                            size: 15,
                            color: grey,
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
