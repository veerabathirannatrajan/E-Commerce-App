import 'package:e_com/services/categories_card.dart';
import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List categories = [
    {'name':'New','image':'new.png'},
    {'name':'Clothes','image':'clothes.png'},
    {'name':'Shoes','image':'shoes.png'},
    {'name':'Accessories','image':'accesories.png'},

  ];

  Color cat1 = Colors.white;
  Color cat2 = Colors.white;
  Color cat3 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(width: 100,),

            Text(
              'Categories',
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 120,),

            IconButton(onPressed: (){
            },
              icon: Icon(Icons.search,
              size: 30,),
              color: Colors.black,)

          ],
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
        
        
          children: [
        
            Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      cat1=Colors.red;
                      cat2=Colors.white;
                      cat3=Colors.white;                  });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 169,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'Women',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 5,
                          width: 169,
                          color: cat1,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      cat1=Colors.white;
                      cat2=Colors.red;
                      cat3=Colors.white;
        
        
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 169,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'men',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 169,
                        color: cat2,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      cat1=Colors.white;
                      cat2=Colors.white;
                      cat3=Colors.red;                  });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 169,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'Kids',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 169,
                        color: cat3,
                      )
                    ],
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 20,),
        
            Container(
              height: 120,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
              ),
              child:  Column(
                children: [
                  SizedBox(height: 25,),
                  Text(
                    'SUMMER SALES',
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Up to 50% off',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 900,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: categories.map((product) {
                  return catCard(name: product['name'],
                    image: product['image'],
                    );
                }).toList(),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
