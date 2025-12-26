import 'package:e_com/services/product_card.dart';
import 'package:flutter/material.dart';

class main2 extends StatefulWidget {
  const main2({super.key});

  @override
  State<main2> createState() => _main2State();
}

class _main2State extends State<main2> {
  List products = [

    {'brand' : 'Mango Boy','name': 'T-Shirt Sailing','price' : '10\$' , 'tag' : 'NEW','image':'T-shirt.png','offer':'10%','rating':'4'},
    {'brand' : 'Dorothy Perkins','name': 'Blouse','price' : '34\$' , 'tag' : 'NEW','image':'Blouse.png','offer':'10%','rating':'5'},
    {'brand' : 'Topshop','name': 'Shirt','price' : '51\$' , 'tag' : 'NEW','image':'Shirt.png','offer':'10%','rating':'3'},
    {'brand' : 'Dorothy Perkins','name': 'Blouse','price' : '34\$' , 'tag' : 'NEW','image':'Shirt (2).png','offer':'10%','rating':'5'},
    {'brand' : 'Topshop','name': 'Shirt','price' : '51\$' , 'tag' : 'NEW','image':'Shirt (3).png','offer':'10%','rating':'3'},

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
                        image: DecorationImage(image: AssetImage('assets/images/main2.jpg'),
                            fit: BoxFit.cover)
                    ),
                    height: 300,
                  ),

                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Text(
                      'Street clothes',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Colors.white,
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
                    Material(
                      color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                        child: Text("Categories",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                              fontSize: 55,
                              color: Colors.black),
                        ),
                        
                        //👇🏼👇🏼👇🏼👇🏼 on tap
                        onTap: (){
                          Navigator.of(context, rootNavigator: true).pushNamed('/categories');

                        },
                      ),
                    ),

                    TextButton(onPressed: (){
                      Navigator.of(context, rootNavigator: true).pushNamed('/categories');

                    },
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
                child: Text("Super summer sale",
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

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w900,
                          fontSize: 55,
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
                child: Text("You've never seen it before",
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
                      offer: 'new',
                      rating: product['rating'],);
                  }).toList(),
                ),
              ),








            ],
          ),
        )

    );
  }
}
