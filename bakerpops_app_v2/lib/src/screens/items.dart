import 'package:bakerpops_app_v2/src/widgets/baker_items.dart';
import 'package:expandable/expandable.dart';

import '../commons/colours.dart';
import '../widgets/bakers.dart';
import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BakerItemsScreen extends StatelessWidget {
  //const BakerItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
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
                //clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "ExpandablePanel",
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          'loremIpsum',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(5))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'loremIpsum',
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            BakerItemsWidget(),
          ],
        ),
      ),
    );
  }
}
