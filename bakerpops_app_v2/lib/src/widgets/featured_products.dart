import '../models/featured_products.dart';
import 'package:flutter/material.dart';
import '../commons/colours.dart';
import 'custom_text.dart';
import '../models/bakers.dart';
import '../utils.dart/vendor_utils.dart';

// List<FeatureProducts> featuredList = [
//   FeatureProducts(
//       name: 'Bluberry Cake', image: '1.jpg', rating: 4.2, wishlist: true),
//   FeatureProducts(
//       name: 'Bluberry Cake', image: '1.jpg', rating: 4.2, wishlist: false),
//   FeatureProducts(
//       name: 'Bluberry Cake', image: '1.jpg', rating: 4.2, wishlist: false),
//   FeatureProducts(
//       name: 'Bluberry Cake', image: '1.jpg', rating: 4.2, wishlist: false),
//   FeatureProducts(
//       name: 'Bluberry Cake', image: '1.jpg', rating: 4.2, wishlist: true),
//   FeatureProducts(
//       name: 'Bluberry Cake', image: '1.jpg', rating: 4.2, wishlist: true),
//   FeatureProducts(
//       name: 'Bluberry Cake', image: '1.jpg', rating: 4.2, wishlist: true),
// ];

class FeaturedProducts extends StatelessWidget {
  final GetPopularVendors objPopularVendors = GetPopularVendors();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        //width: 100,
        child: FutureBuilder(
          future: objPopularVendors.getPopularVendors(),
          builder: (BuildContext ctx,
              AsyncSnapshot<List<FeatureProducts>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 220,
                      width: 220,
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
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "${snapshot.data![index].image}",
                              width: 220,
                              //height: 100,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomText(
                                  text: "${snapshot.data![index].name}",
                                  color: grey,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: white,
                                      offset: Offset(1, 1),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: snapshot.data![index].wishlist
                                        ? Icon(
                                            Icons.favorite,
                                            size: 18,
                                            color: red,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            size: 18,
                                            color: red,
                                          )),
                              )
                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomText(
                                  text: "${snapshot.data![index].rating}",
                                  size: 15,
                                  color: grey,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
