import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/products_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selDropDown;
  RangeValues values = const RangeValues(0, 2400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home page",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("Cart_page");
              },
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    DropdownButton(
                      onChanged: (val) {
                        setState(() {
                          selDropDown = val as String;
                        });
                      },
                      hint: const Text("Select category..."),
                      value: selDropDown,
                      items: ProductData.allProductData
                          .map(
                            (e) => DropdownMenuItem(
                              value: e['categoryName'],
                              child: Text(e['categoryName']),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(width: 10),
                    (selDropDown != null)
                        ? ActionChip(
                            onPressed: () {
                              setState(() {
                                selDropDown = null;
                                values = const RangeValues(0, 2400);
                              });
                            },
                            avatar: const Icon(Icons.close),
                            label: const Text("Clear"),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            (selDropDown != null)
                ? Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "From",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$ ${values.start.toInt()}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Expanded(
                        child: RangeSlider(
                          values: values,
                          max: 2400,
                          min: 0,
                          onChanged: (RangeValues val) {
                            setState(() {
                              values = val;
                            });
                          },
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            "To",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$ ${values.end.toInt()}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...ProductData.allProductData.map(
                      (val) {
                        return ((selDropDown == val['categoryName']) ||
                                selDropDown == null)
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        "${val['categoryName']}",
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...val['categoryProducts'].map(
                                            (e) =>
                                                (e['price'] >= values.start &&
                                                        e['price'] <=
                                                            values.end)
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  'DetailPage',
                                                                  arguments: e);
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          height: 350,
                                                          width: 220,
                                                          decoration:
                                                              const BoxDecoration(
                                                            // color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  20),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: 330,
                                                                width: 215,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                  ),
                                                                  // color: Colors.grey,
                                                                ),
                                                                child: Column(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 5,
                                                                        child:
                                                                            Container(
                                                                          decoration: BoxDecoration(
                                                                              image: DecorationImage(
                                                                                image: NetworkImage("${e['thumbnail']}"),
                                                                              ),
                                                                              // color: Colors.blue,
                                                                              borderRadius: const BorderRadius.only(
                                                                                topRight: Radius.circular(20),
                                                                                topLeft: Radius.circular(20),
                                                                              ),
                                                                              color: Colors.white),
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                alignment: Alignment.center,
                                                                                height: 35,
                                                                                width: 65,
                                                                                decoration: const BoxDecoration(
                                                                                  color: Color(0xffb71c1c),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(20),
                                                                                    bottomRight: Radius.circular(10),
                                                                                  ),
                                                                                ),
                                                                                child: Text(
                                                                                  "${e['discountPercentage']}",
                                                                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomRight: Radius.circular(20),
                                                                                bottomLeft: Radius.circular(20),
                                                                              ),
                                                                              boxShadow: <BoxShadow>[
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  blurRadius: 1,
                                                                                  offset: Offset(0, 1),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 8.0),
                                                                                  child: Text(
                                                                                    "${e['title']}",
                                                                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 8.0),
                                                                                  child: Text(
                                                                                    "\$${e['price']}",
                                                                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                                                  child: RatingBar.builder(
                                                                                    ignoreGestures: true,
                                                                                    itemSize: 25,
                                                                                    direction: Axis.horizontal,
                                                                                    allowHalfRating: true,
                                                                                    initialRating: double.parse(e['rating'].toString()),
                                                                                    itemCount: 5,
                                                                                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                                                    itemBuilder: (context, _) => const Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                    ),
                                                                                    onRatingUpdate: (rating) {},
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
