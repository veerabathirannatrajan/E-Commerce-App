import 'package:e_com/services/product_card.dart';
import 'package:flutter/material.dart';

class main2 extends StatefulWidget {
  const main2({super.key});

  @override
  State<main2> createState() => _main2State();
}

class _main2State extends State<main2> {
  final List products = [
    {'brand':'Urban Edge','name':'Minimal Accessories Set','price':'18','tag':'NEW','image':'accesories.png','offer':'10%','rating':'4'},
    {'brand':'Noir Studio','name':'Classic Black Outfit','price':'48','tag':'NEW','image':'black.png','offer':'15%','rating':'5'},
    {'brand':'Velora','name':'Soft Cotton Blouse','price':'36','tag':'NEW','image':'Blouse.png','offer':'10%','rating':'5'},
    {'brand':'Street Mode','name':'Casual Street Wear','price':'58','tag':'NEW','image':'clothes.png','offer':'20%','rating':'4'},
    {'brand':'Luna Wear','name':'Elegant Evening Dress','price':'82','tag':'NEW','image':'Evening Dress.png','offer':'15%','rating':'5'},
    {'brand':'North Peak','name':'Winter Comfort Hoodie','price':'44','tag':'NEW','image':'hoodies.png','offer':'10%','rating':'4'},
    {'brand':'Pure Silk','name':'Light Summer Blouse','price':'34','tag':'NEW','image':'Light blouse.png','offer':'10%','rating':'4'},
    {'brand':'VioLine','name':'Long Sleeve Casual Top','price':'39','tag':'NEW','image':'Longsleeve Violeta.png','offer':'12%','rating':'5'},
    {'brand':'ColdWave','name':'Warm Knit Pullover','price':'46','tag':'NEW','image':'Pullover.png','offer':'10%','rating':'4'},
    {'brand':'Prime Tailor','name':'Slim Fit Formal Shirt','price':'52','tag':'NEW','image':'Shirt.png','offer':'10%','rating':'4'},
    {'brand':'Urban Stitch','name':'Checked Casual Shirt','price':'49','tag':'NEW','image':'Shirt (2).png','offer':'10%','rating':'4'},
    {'brand':'Modern Fit','name':'Relaxed Cotton Shirt','price':'47','tag':'NEW','image':'Shirt (3).png','offer':'10%','rating':'3'},
    {'brand':'Active Life','name':'Breathable Sport Dress','price':'62','tag':'NEW','image':'Sport Dress.png','offer':'15%','rating':'5'},
    {'brand':'Flex Wear','name':'Performance Training Dress','price':'68','tag':'NEW','image':'Sport Dress (2).png','offer':'15%','rating':'5'},
    {'brand':'Ocean Blue','name':'Sailing Graphic T-Shirt','price':'22','tag':'NEW','image':'T-Shirt Sailing.png','offer':'10%','rating':'4'},
    {'brand':'Daily Basics','name':'Essential White T-Shirt','price':'19','tag':'NEW','image':'T-shirt.png','offer':'10%','rating':'4'},
    {'brand':'Casual Core','name':'Printed Casual Tee','price':'21','tag':'NEW','image':'T-Shirt (2).png','offer':'10%','rating':'4'},
    {'brand':'Urban Flex','name':'Modern Fit Tee','price':'23','tag':'NEW','image':'T-Shirt (3).png','offer':'10%','rating':'4'},
    {'brand':'Espana Style','name':'Spanish Graphic T-Shirt','price':'25','tag':'NEW','image':'T-Shirt SPANISH.png','offer':'10%','rating':'4'},
    {'brand':'Step Up','name':'Elegant High Heel Shoes','price':'74','tag':'NEW','image':'shoes.png','offer':'20%','rating':'5'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HERO IMAGE
            Stack(
              children: [
                Container(
                  height: height * 0.35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/main2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: height * 0.04,
                  left: width * 0.05,
                  child: Text(
                    'Street clothes',
                    style: TextStyle(
                      fontSize: width * 0.13,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.03),

            /// CATEGORIES TITLE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed('/categories');
                    },
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: width * 0.11,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed('/categories');
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(fontSize: width * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Text(
                "Super summer sale",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.grey[600],
                ),
              ),
            ),

            /// FIRST PRODUCT LIST
            SizedBox(
              height: height * 0.36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    name: product['name'],
                    brand: product['brand'],
                    image: product['image'],
                    price: product['price'],
                    tag: product['tag'],
                    offer: product['offer'],
                    rating: product['rating'],
                  );
                },
              ),
            ),


            /// NEW SECTION
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New",
                    style: TextStyle(
                      fontSize: width * 0.11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: TextStyle(fontSize: width * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Text(
                "You've never seen it before",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.grey[600],
                ),
              ),
            ),

            /// SECOND PRODUCT LIST
            SizedBox(
              height: height * 0.45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    name: product['name'],
                    brand: product['brand'],
                    image: product['image'],
                    price: product['price'],
                    tag: product['tag'],
                    offer: 'NEW',
                    rating: product['rating'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
