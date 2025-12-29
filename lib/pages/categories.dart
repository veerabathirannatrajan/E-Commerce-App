import 'package:e_com/services/categories_card.dart';
import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List categories = [
    {'name': 'New', 'image': 'new.png'},
    {'name': 'Clothes', 'image': 'clothes.png'},
    {'name': 'Shoes', 'image': 'shoes.png'},
    {'name': 'Accessories', 'image': 'accesories.png'},
  ];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(
            fontSize: w * 0.07,
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
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        children: [

          // ================== CATEGORY TABS ==================
          Row(
            children: List.generate(3, (index) {
              final titles = ['Women', 'Men', 'Kids'];
              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => selectedTab = index);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.06,
                        child: Center(
                          child: Text(
                            titles[index],
                            style: TextStyle(
                              fontSize: w * 0.055,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 4,
                        color: selectedTab == index
                            ? Colors.red
                            : Colors.transparent,
                      )
                    ],
                  ),
                ),
              );
            }),
          ),

          SizedBox(height: h * 0.03),

          // ================== SALE BANNER ==================
          Container(
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
                  'Up to 50% off',
                  style: TextStyle(
                    fontSize: w * 0.045,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: h * 0.02),

          // ================== CATEGORY LIST ==================
          ...categories.map((product) {
            return catCard(
              name: product['name'],
              image: product['image'],
            );
          }).toList(),
        ],
      ),
    );
  }
}
