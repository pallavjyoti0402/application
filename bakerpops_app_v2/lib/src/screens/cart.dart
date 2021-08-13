import 'package:bakerpops_app_v2/src/commons/colours.dart';
import 'package:bakerpops_app_v2/src/models/cart_items.dart';
import 'package:bakerpops_app_v2/src/widgets/cart_items.dart';
import 'package:bakerpops_app_v2/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

List<CartItemModel> cartItemList = [
  CartItemModel(name: 'Cake1', image: '1.jpg', quantity: 1),
  CartItemModel(name: 'Cake1', image: '1.jpg', quantity: 1),
  CartItemModel(name: 'Cake1', image: '1.jpg', quantity: 1),
];

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: cartItemList
                  .map<Widget>((cartItem) => CartItemWidget())
                  .toList(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'Apply Coupon',
                    size: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: "COUPON CODE",
                          border: InputBorder.none,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'Add Delivery Address',
                    size: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    height: 200,
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
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: "Add Address",
                          border: InputBorder.none,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'Add Phone Number',
                    size: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).accentColor,
                        height: 60,
                        child: Text(
                          "Place Order",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
