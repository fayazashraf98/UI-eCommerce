import 'package:flutter/material.dart';

import '../services/constant_widgets.dart';
import 'cart_page.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.item});
  final Item item;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Item> cartItems = [];

  String _selectedSize = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffef7f9),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 20, left: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Color(0xffE96E6E),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset("assets/icons/profile.png"),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.item.color,
                  image: DecorationImage(
                      image: AssetImage(widget.item.image),
                      fit: BoxFit.contain)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.item.title,
                        style: const TextStyle(
                            color: Color(0xff444444), fontSize: 20),
                      ),
                      Text(
                        widget.item.price,
                        style: const TextStyle(
                            color: Color(0xff444444), fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow.shade800,
                          );
                        }),
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Size",
                        style:
                            TextStyle(color: Color(0xff444444), fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 30,
                                height: 30,
                                color: _selectedSize == index
                                    ? Color(0xffE96E6E)
                                    : Colors.white,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectedSize = index.toString();
                                      setState(() {});
                                    },
                                    child: Text(
                                      sizes[index],
                                      style: TextStyle(
                                        color: _selectedSize == index
                                            ? Colors.green
                                            : Colors.black,

                                        //color: Color(0xff444444)

                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Colors",
                        style:
                            TextStyle(color: Color(0xff444444), fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 30,
                                height: 30,
                                color: item.color,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin:
                  const EdgeInsets.only(left: 4, right: 4, top: 10, bottom: 10),
              padding: const EdgeInsets.all(10),
              child: Text(
                textAlign: TextAlign.justify,
                widget.item.description,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
              child: GestureDetector(
                onTap: () {
                  cartItems.add(widget.item);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CartPage(
                            cartItems: cartItems,
                          )));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffE96E6E),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
