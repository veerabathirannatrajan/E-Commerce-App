import 'package:e_com/pages/main.dart';
import 'package:e_com/services/dropdown.dart';
import 'package:e_com/services/product_card.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  final VoidCallback onViewAll;

  const home({super.key,required this.onViewAll});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentIndex = 0;


  List products = [

    {'brand' : 'Mango Boy','name': 'T-Shirt Sailing','price' : '10' , 'tag' : 'NEW','image':'T-shirt.png','offer':'10%','rating':'4'},
    {'brand' : 'Dorothy Perkins','name': 'Blouse','price' : '34' , 'tag' : 'NEW','image':'Blouse.png','offer':'10%','rating':'5'},
    {'brand' : 'Topshop','name': 'Shirt','price' : '51' , 'tag' : 'NEW','image':'Shirt.png','offer':'10%','rating':'3'},
    {'brand' : 'Dorothy Perkins','name': 'Blouse','price' : '34' , 'tag' : 'NEW','image':'Shirt (2).png','offer':'10%','rating':'5'},
    {'brand' : 'Topshop','name': 'Shirt','price' : '51' , 'tag' : 'NEW','image':'Shirt (3).png','offer':'10%','rating':'3'},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/home1.png'),
                    fit: BoxFit.cover)
                  ),
                  height: 600,
                ),

                Positioned(top:300,
                  bottom: 0,
                  left: 20,
                  child: Text(
                  'Fashion',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                ),
                Positioned(top:360,
                  bottom: 0,
                  left: 20,
                  child: Text(
                    'Sale',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),



                Positioned(
                  top: 480,
                  left: 20,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 18
                      )
                      ),


                    ),

                    onPressed: (){
                      Navigator.of(context, rootNavigator: true).pushNamed('/check');

                    },
                    child: Text("Check",

                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 20,
                          color: Colors.white),


                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                        color: Colors.black),
                  ),

                  TextButton(onPressed: (){},
                      child: Text("View all",
                        style: TextStyle(
                          color: Colors.grey[850],
                          fontSize: 15
                        ),
                  ),
                  )
                ],


              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("You’ve never seen it before!",
                style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
            ),

            SizedBox(
              height: 370,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: products.map((product) {
                  return ProductCard(name: product['name'],
                      brand: product['brand'],
                      image: product['image'],
                      price: product['price'],
                      tag: product['tag'],
                      offer: product['offer'],
                      rating: product['rating'],);
                }).toList(),
              ),
            ),

            SizedBox(height: 40,),

            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 18
                  )
                  ),


                ),

                onPressed: widget.onViewAll,
                child: Text("view all sale",

                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      color: Colors.white),


                ),
              ),
            ),







          ],
        ),
      )

    );
  }
}
