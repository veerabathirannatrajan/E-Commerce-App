import 'package:e_com/services/cart_card.dart';
import 'package:e_com/services/cart_data.dart';
import 'package:e_com/services/categories_card.dart';
import 'package:e_com/services/product_card.dart';
import 'package:flutter/material.dart';

class product extends StatefulWidget {
  final String name;
  final String brand;
  final String image;
  final String price;
  final String offer;
  final int rating;

  const product({
    super.key,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.offer,
    required this.rating,
  });

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {

  List products = [
    {'brand' : 'Mango Boy','name': 'T-Shirt Sailing','price' : '10' , 'tag' : 'NEW','image':'T-shirt.png','offer':'10%','rating':'4'},
    {'brand' : 'Dorothy Perkins','name': 'Blouse','price' : '34' , 'tag' : 'NEW','image':'Blouse.png','offer':'10%','rating':'5'},
    {'brand' : 'Topshop','name': 'Shirt','price' : '51' , 'tag' : 'NEW','image':'Shirt.png','offer':'10%','rating':'3'},
    {'brand' : 'Dorothy Perkins','name': 'Blouse','price' : '34' , 'tag' : 'NEW','image':'Shirt (2).png','offer':'10%','rating':'5'},
    {'brand' : 'Topshop','name': 'Shirt','price' : '51' , 'tag' : 'NEW','image':'Shirt (3).png','offer':'10%','rating':'3'},
  ];

  String? size1;
  String? color1;

  late int len = products.length;
  Color favcolor = Colors.grey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.name,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
        ),
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios,
          size: 30,) ,
          onPressed: () {
            Navigator.pop(context);
          },

        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 700,
                    width: 450,
        
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/${widget.image}'),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ],
              ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        
            // 🔽 Size Dropdown
            SizedBox(
              width: 160,
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                isDense: true,
                menuMaxHeight: 220,
                alignment:Alignment.center ,
                decoration: InputDecoration(
                  labelText: 'Size',
                  labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                value: size1,
        
                dropdownColor: Colors.white,
                items: ['XS', 'S', 'M', 'L', 'XL']
                    .map(
                      (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  setState(() => size1 = value);
                },
              ),
            ),
        
            const SizedBox(width: 12),
        
            // 🔽 Color Dropdown
            SizedBox(
              width: 160,
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                isDense: true,
                menuMaxHeight: 220,
                decoration: InputDecoration(
                  labelText: 'Color',
                  labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                value: color1,
                dropdownColor: Colors.white,
                items: ['Red', 'Black', 'Blue','White']
                    .map(
                      (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  setState(() => color1 = value);
                },
              ),
            ),
        
            const SizedBox(width: 12),
        
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              elevation: 2,
              child: IconButton(onPressed: (){
                //👇🏼👇🏼👇🏼👇🏼 favorite

                setState(() {
                  favcolor=Colors.red;
                });

                if (size1 == null || color1 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select size and color")),
                  );
                  return;
                }

                favList.add(
                  CartItem(
                    name: widget.name,
                    brand: widget.brand,
                    image: widget.image,
                    price: int.tryParse(
                      widget.price.replaceAll(RegExp(r'[^0-9]'), ''),
                    ) ?? 0,
                    offer: widget.offer,
                    size: size1!,
                    color: color1!,
                    quantity: 1,
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to favorite")),
                );
              },
                  icon: Icon(Icons.favorite,
                    color: favcolor,)),
            ),
          ],
        ),
              SizedBox(height: 20,),
        
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.brand,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          letterSpacing:  1
                        ),
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            letterSpacing:  1
                        ),
                      ),

                      Row(
                        children: List.generate(
                          5,
                              (i) => Icon(
                            i < widget.rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    '\$${widget.price}',
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.w900
                    ),
                  ),

                ],
              ),
        
              SizedBox(height: 30,),

              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                        horizontal: 140,
                        vertical: 18
                    )
                    ),


                  ),
                  //👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼 add to cart
                  onPressed: () {
                    if (size1 == null || color1 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select size and color")),
                      );
                      return;
                    }

                    cartList.add(
                      CartItem(
                        name: widget.name,
                        brand: widget.brand,
                        image: widget.image,
                        price: int.tryParse(
                          widget.price.replaceAll(RegExp(r'[^0-9]'), ''),
                        ) ?? 0,
                        offer: widget.offer,
                        size: size1!,
                        color: color1!,
                        quantity: 1,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to cart")),
                    );
                  },


                  child: Text("ADD TO CART",

                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Colors.white),


                  ),
                ),
              ),

              SizedBox(height: 20,  ),

              Container(
                color: Colors.grey[100],
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping info",
                      style:  TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),

              ),
              SizedBox(height: 10,),
              Container(
                color: Colors.grey[100],
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Support",
                      style:  TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),

              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("You can also like this",
                    style:  TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w900
                    ),
                  ),

                  Text("$len items",
                    style:  TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
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


            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        elevation: 2,
        onPressed: () {
          Navigator.pop(context);
        },
        icon:  Icon(Icons.arrow_back_ios,
        size: 20,
        color: Colors.grey,),
        label: Text(
          'Back',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),



    );
  }
}
