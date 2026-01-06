import 'package:e_com/services/categories_card.dart';
import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List<Map<String, String>> menCategories = [
    {'name': 'Clothes', 'image': 'Shirt (2).png'},
    {'name': 'Shoes', 'image': 'men_shoes.jpg'},
    {'name': 'Accessories', 'image': 'men_acc.jpg'},
    {'name': 'Watches', 'image': 'men_watch.jpg'},
  ];

  List<Map<String, String>> womenCategories = [
    {'name': 'Tops', 'image': 'Blouse.png'},
    {'name': 'Dresses', 'image': 'Longsleeve Violeta.png'},
    {'name': 'Shoes', 'image': 'shoes.png'},
    {'name': 'Accessories', 'image': 'accesories.png'},
  ];

  List<Map<String, String>> kidsCategories = [
    {'name': 'T-Shirts', 'image': 'kid_ts.jpg'},
    {'name': 'Shorts', 'image': 'kid_shorts.jpg'},
    {'name': 'Shoes', 'image': 'kid_shoe.jpg'},
    {'name': 'Toys', 'image': 'toys.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
            splashColor: Colors.transparent,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Categories',
            style: TextStyle(
              fontSize: w * 0.08,
              letterSpacing: 2,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, size: w * 0.07, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Men'),
              Tab(text: 'Women'),
              Tab(text: 'Kids'),
            ],
            indicatorColor: Colors.red,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            // ================= Men Tab =================
            ListView(
              padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.02),
              children: [
                saleBanner(w, h,60),

                SizedBox(height: h * 0.02),
                ...menCategories.map(
                      (product) => catCard(
                    name: product['name']!,
                    image: product['image']!,
                  ),
                ),
              ],
            ),

            // ================= Women Tab =================
            ListView(
              padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.02),
              children: [
                saleBanner(w, h, 30),

                SizedBox(height: h * 0.02),
                ...womenCategories.map(
                      (product) => catCard(
                    name: product['name']!,
                    image: product['image']!,
                  ),
                ),
              ],
            ),

            // ================= Kids Tab =================
            ListView(
              padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.02),
              children: [
                saleBanner(w, h , 20),

                SizedBox(height: h * 0.02),
                ...kidsCategories.map(
                      (product) => catCard(
                    name: product['name']!,
                    image: product['image']!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget saleBanner(double w, double h,int a) {
  return Container(
    height: h * 0.14,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'SUMMER SALES',
          style: TextStyle(
            fontSize: w * 0.07,
            letterSpacing: 2,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        Text(
          'Up to $a% off',
          style: TextStyle(
            fontSize: w * 0.045,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

