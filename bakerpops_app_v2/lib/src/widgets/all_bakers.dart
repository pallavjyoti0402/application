import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:bakerpops_app_v2/src/commons/screen_navigator.dart';
import 'package:bakerpops_app_v2/src/screens/items.dart';

import '../commons/colours.dart';
import '../models/bakers.dart';
import '../utils.dart/vendor_utils.dart';
import 'custom_text.dart';

class AllBakers extends StatelessWidget {
  final GetVendors objGetVendors = GetVendors();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: FutureBuilder(
          future: objGetVendors.getVendors(),
          builder: (BuildContext ctx, AsyncSnapshot<List<Bakers>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          changeScreen(_, BakerItemsScreen());
                        },
                        child: Container(
                          height: 400,
                          //width: 220,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: grey,
                                offset: Offset(1, 1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(children: <Widget>[
                            Container(
                              height: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                child: Carousel(
                                  images: [
                                    NetworkImage(
                                        "${snapshot.data![index].flagship_cake}"),
                                    NetworkImage(
                                        "${snapshot.data![index].flagship_cake}"),
                                    NetworkImage(
                                        "${snapshot.data![index].flagship_cake}"),
                                    NetworkImage(
                                        "${snapshot.data![index].flagship_cake}"),
                                  ],
                                  dotBgColor: Colors.transparent,
                                  dotColor: grey,
                                  dotSize: 6.0,
                                  dotIncreasedColor: grey,
                                  autoplay: false,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: "${snapshot.data![index].name}",
                                    size: 18,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: white,
                                          offset: Offset(1, 1),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          CustomText(
                                            text:
                                                "${snapshot.data![index].rating}",
                                            size: 15,
                                            color: black,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomText(
                                    text: "${snapshot.data![index].area}",
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text:
                                        "${snapshot.data![index].description}",
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
