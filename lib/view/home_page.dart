import 'package:flutter/material.dart';
import '../services/constant_widgets.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> _cartItems = [];

  List<ListItem> _listItems = [
    ListItem(title: "Trending Now", isSelected: true),
    ListItem(title: "All"),
    ListItem(title: "New"),
  ];
  int _selectedIndex = 0;

  void _onListItemPressed(int index) {
    setState(() {
      _listItems = _listItems.map((item) {
        if (item == _listItems[index]) {
          return ListItem(title: item.title, isSelected: true);
        } else {
          return ListItem(title: item.title, isSelected: false);
        }
      }).toList();
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset("assets/icons/dots.png"),
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
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Match Your Style",
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                fillColor: Colors.white,
                filled: true,
                hintText: "Search",
                hintStyle:
                    const TextStyle(color: Color(0xffB6B6B6), fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listItems.length,
                  itemBuilder: (context, index) {
                    final item = _listItems[index];
                    return GestureDetector(
                      onTap: () => _onListItemPressed(index),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: item.isSelected
                              ? const Color(0xffE96E6E)
                              : const Color(0xffDFDCDC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            item.title,
                            style: TextStyle(
                                color: item.isSelected
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 280),
                  itemBuilder: (context, index) {
                    final item = items[index];

                    final isFavorite = favoriteIndices.contains(index);
                    return Column(
                      children: [
                        Expanded(
                          child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsPage(item: item)));
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(
                                    //         builder: (context) => DetailsPage(
                                    //               item: item,
                                    //             )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: item.color,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(item.image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 5, top: 5),
                                  child: SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: IconButton(
                                        icon: Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isFavorite
                                                ? Colors.red
                                                : Colors.red),
                                        onPressed: () {
                                          if (isFavorite) {
                                            favoriteIndices.remove(index);
                                          } else {
                                            favoriteIndices.add(index);
                                          }
                                          setState(
                                            () {},
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    item.title.toString(),
                                    style: const TextStyle(fontSize: 19),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    item.price.toString(),
                                    style: const TextStyle(
                                        color: Color(0xff9C9C9C), fontSize: 19),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            )),
          ],
        ),
      )),
    );
  }
}
