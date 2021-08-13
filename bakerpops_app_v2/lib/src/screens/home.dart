import 'package:bakerpops_app_v2/src/commons/screen_navigator.dart';
import 'package:bakerpops_app_v2/src/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commons/colours.dart';
import '../widgets/custom_text.dart';
import '../widgets/categories.dart';
import '../widgets/featured_products.dart';
import '../widgets/all_bakers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'Welcome to BakerPops...!!!!',
                    size: 18,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications_none)),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                )
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
            SizedBox(
              height: 5,
            ),
            Caregories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Popular Bakes',
                size: 20,
                color: grey,
              ),
            ),
            FeaturedProducts(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Our HomeBakers',
                size: 20,
                color: grey,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            AllBakers(),
            Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/1.jpg',
                    width: 390,
                    //height: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'Paul Bakery',
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
                                text: '4.4',
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
                        text: 'Indranagar',
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
                            'A bakery is an establishment that produces and sells flour-based food baked in an oven such as bread, cookies, cakes, pastries, and pies.[1] Some retail bakeries are also categorized as cafés, serving coffee and tea to customers who wish to consume the baked goods on the premises. Confectionery items are also made in most bakeries throughout the world.',
                        color: grey,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  changeScreen(context, CartScreen());
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
