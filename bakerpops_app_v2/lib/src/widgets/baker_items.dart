import 'package:bakerpops_app_v2/src/commons/colours.dart';
import 'package:bakerpops_app_v2/src/models/baker_items.dart';
import 'package:bakerpops_app_v2/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'add_item.dart';

List<BakersItemModel> bakerItemsList = [
  BakersItemModel(name: 'Cake Name 1', image: '1.jpg'),
  BakersItemModel(name: 'Cake Name 2', image: '1.jpg'),
  BakersItemModel(name: 'Cake Name 3', image: '1.jpg'),
  BakersItemModel(name: 'Cake Name 4', image: '1.jpg'),
  BakersItemModel(name: 'Cake Name 5', image: '1.jpg'),
  BakersItemModel(name: 'Cake Name 6', image: '1.jpg'),
  BakersItemModel(name: 'Cake Name 7', image: '1.jpg'),
  BakersItemModel(name: 'Cake Name 8', image: '1.jpg'),
];

class BakerItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: bakerItemsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 330,
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
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        'images/${bakerItemsList[index].image}',
                        width: 420,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 0.0,
                        right: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: '${bakerItemsList[index].name}',
                            size: 18,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart,
                              size: 30,
                            ),
                            tooltip: 'Add to cart',
                            highlightColor: grey,
                            focusColor: grey,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddItemWidget(
                                      text: '${bakerItemsList[index].name}');
                                },
                              );
                              //AddItemWidget();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            text: 'In Party, celebration, picture,test,',
                            size: 16,
                            color: grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
