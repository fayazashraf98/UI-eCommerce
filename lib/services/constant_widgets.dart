import 'dart:ui';

class ListItem {
  final String title;
  final bool isSelected;

  ListItem({required this.title, this.isSelected = false});
}

List<String> sizes = [
  'S',
  'M',
  'L',
  'XL',
];

List<int> favoriteIndices = [];

class Item {
  final Color color;
  final String image;
  final String price;
  final String title;
  final String sizes;
  final String description;

  const Item(
      {required this.description,
      required this.color,
      required this.image,
      required this.price,
      required this.title,
      required this.sizes});
}

final List<Item> items = [
  const Item(
    color: Color(0xffe3a122),
    image: "assets/images/female/black.png",
    price: "\$45.5",
    title: "Black Jacket",
    sizes: 'S',
    description:
        'Stay cool and stylish this summer with Levice\'s lightweight jacket. Made from breathable materials and designed with a modern, minimalist aesthetic, it\'s the perfect addition to your warm-weather wardrobe.',
  ),
  const Item(
    color: Color(0xffe84c57),
    image: "assets/images/female/blue.png",
    price: "\$85.0",
    title: "Blue Jacket",
    sizes: 'M',
    description:
        'Levice\'s summer denim jacket is the perfect way to add some edge and style to your warm-weather wardrobe. Made from lightweight and breathable materials, this jacket is comfortable and easy to wear in even the hottest temperatures. The classic denim fabric and flattering fit make it a versatile piece that can be dressed up or down to suit any occasion.',
  ),
  const Item(
    color: Color(0xffb07c4e),
    image: "assets/images/female/merron.png",
    price: "\$50.6",
    title: "Red Jacket",
    sizes: 'L',
    description:
        'Add a pop of color to your summer wardrobe with Levice\'s vibrant jacket. Made from lightweight materials and featuring a flattering fit, this jacket is perfect for layering over your favorite outfits on cooler summer days. With its bold color and stylish design, it\'s the perfect way to make a statement this season.',
  ),
  const Item(
    color: Color(0xff3d8748),
    image: "assets/images/female/shirt.png",
    price: "\$145.9",
    title: "Blue Coat",
    sizes: 'XL',
    description:
        'Stay cool and comfortable this summer with Levice\'s sweet shirt. Made from soft and breathable materials, this shirt is perfect for warmer temperatures. With its stylish design and feminine details, it\'s the perfect way to add some charm to your summer wardrobe. Dress it up or down for any occasion."',
  ),
  const Item(
    color: Color(0xff5b2c11),
    image: "assets/images/female/purple.png",
    price: "\$425.0",
    title: "Red Shirt",
    sizes: 'XXL',
    description:
        '"Levice\'s summer sweet shirt is the perfect addition to your warm-weather wardrobe. Made from lightweight and breathable materials, this shirt is comfortable and easy to wear on even the hottest days.',
  ),
];
