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
    {'brand': 'Mango Boy', 'name': 'T-Shirt Sailing', 'price': '10', 'tag': 'NEW', 'image': 'T-shirt.png', 'offer': '10%', 'rating': '4'},
    {'brand': 'Dorothy Perkins', 'name': 'Blouse', 'price': '34', 'tag': 'NEW', 'image': 'Blouse.png', 'offer': '10%', 'rating': '5'},
    {'brand': 'Topshop', 'name': 'Shirt', 'price': '51', 'tag': 'NEW', 'image': 'Shirt.png', 'offer': '10%', 'rating': '3'},
    {'brand': 'Dorothy Perkins', 'name': 'Blouse', 'price': '34', 'tag': 'NEW', 'image': 'Shirt (2).png', 'offer': '10%', 'rating': '5'},
    {'brand': 'Topshop', 'name': 'Shirt', 'price': '51', 'tag': 'NEW', 'image': 'Shirt (3).png', 'offer': '10%', 'rating': '3'},
  ];

  String? size1;
  String? color1;

  late int len = products.length;
  Color favcolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: width/8,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(widget.name,
              style: TextStyle(fontSize: width * 0.07, fontWeight: FontWeight.w900),
            ),
            IconButton(onPressed: (){},
                icon: Icon(Icons.share,
                size: 30,)),
            
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: width * 0.07),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: height * 0.55,
                    width: width * 0.91,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/${widget.image}'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              // ✅ Size, Color, Favorite Row (Fixed overflow)
              Row(
                children: [
                  Flexible(
                    child: DropdownButtonFormField<String>(
                      borderRadius: BorderRadius.circular(20),
                      isDense: true,
                      menuMaxHeight: height * 0.25,
                      decoration: InputDecoration(
                        labelText: 'Size',
                        labelStyle: TextStyle(fontSize: width * 0.045, color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
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
                      items: ['XS', 'S', 'M', 'L', 'XL'].map(
                            (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: TextStyle(fontSize: width * 0.04)),
                        ),
                      ).toList(),
                      onChanged: (value) => setState(() => size1 = value),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Flexible(
                    child: DropdownButtonFormField<String>(
                      borderRadius: BorderRadius.circular(20),
                      isDense: true,
                      menuMaxHeight: height * 0.3,
                      decoration: InputDecoration(
                        labelText: 'Color',
                        labelStyle: TextStyle(fontSize: width * 0.045, color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
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
                      items: ['Red', 'Black', 'Blue', 'White'].map(
                            (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: TextStyle(fontSize: width * 0.04)),
                        ),
                      ).toList(),
                      onChanged: (value) => setState(() => color1 = value),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    elevation: 2,
                    child: IconButton(
                      onPressed: () {
                        setState(() => favcolor = Colors.red);

                        if (size1 == null || color1 == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please select size and color", style: TextStyle(color: Colors.black, fontSize: width * 0.04)),
                              margin: EdgeInsets.symmetric(horizontal: width * 0.12, vertical: height * 0.02),
                              padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.grey[100],
                            ),
                          );
                          return;
                        }

                        final list = List<CartItem>.from(favListNotifier.value);
                        list.add(
                          CartItem(
                            name: widget.name,
                            brand: widget.brand,
                            image: widget.image,
                            price: int.tryParse(widget.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
                            offer: widget.offer,
                            size: size1!,
                            color: color1!,
                            quantity: 1,
                          ),
                        );
                        favListNotifier.value = list;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Added to favorite", style: TextStyle(color: Colors.black, fontSize: width * 0.04)),
                            margin: EdgeInsets.symmetric(horizontal: width * 0.12, vertical: height * 0.02),
                            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.grey[100],
                          ),
                        );
                      },
                      icon: Icon(Icons.favorite, color: favcolor),
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              // ✅ Brand, Name, Rating & Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.brand, style: TextStyle(fontSize: width * 0.08, fontWeight: FontWeight.w900)),
                      Text(widget.name, style: TextStyle(fontSize: width * 0.045, color: Colors.grey)),
                      Row(
                        children: List.generate(
                          5,
                              (i) => Icon(
                            i < widget.rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: width * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('\$${widget.price}', style: TextStyle(fontSize: width * 0.12, fontWeight: FontWeight.w900)),
                ],
              ),

              SizedBox(height: height * 0.03),

              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: width * 0.3, vertical: height * 0.02)),
                  ),
                  onPressed: () {
                    if (size1 == null || color1 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select size and color", style: TextStyle(color: Colors.black, fontSize: width * 0.04)),
                          margin: EdgeInsets.symmetric(horizontal: width * 0.12, vertical: height * 0.02),
                          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.grey[100],
                        ),
                      );
                      return;
                    }

                    final list = List<CartItem>.from(cartListNotifier.value);
                    list.add(
                      CartItem(
                        name: widget.name,
                        brand: widget.brand,
                        image: widget.image,
                        price: int.tryParse(widget.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
                        offer: widget.offer,
                        size: size1!,
                        color: color1!,
                        quantity: 1,
                      ),
                    );
                    cartListNotifier.value = list;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Added to cart", style: TextStyle(color: Colors.black, fontSize: width * 0.04)),
                        margin: EdgeInsets.symmetric(horizontal: width * 0.12, vertical: height * 0.02),
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.grey[100],
                      ),
                    );
                  },
                  child: Text("ADD TO CART", style: TextStyle(letterSpacing: 1, fontSize: width * 0.045, color: Colors.white)),
                ),
              ),

              SizedBox(height: height * 0.02),

              // ✅ Shipping & Support
              Container(
                height: height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping info", style: TextStyle(fontSize: width * 0.06,
                      color: Colors.black)),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)

                ),                height: height * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Support", style: TextStyle(fontSize: width * 0.06,
                      color: Colors.black)),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // ✅ "You can also like this"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("You can also like this", style: TextStyle(fontSize: width * 0.07, fontWeight: FontWeight.w900)),
                  Text("$len items", style: TextStyle(fontSize: width * 0.045, color: Colors.grey)),
                ],
              ),
              SizedBox(height: height * 0.02),

              SizedBox(
                height: height * 0.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: products.map((product) {
                    return ProductCard(
                      name: product['name'],
                      brand: product['brand'],
                      image: product['image'],
                      price: product['price'],
                      tag: product['tag'],
                      offer: product['offer'],
                      rating: product['rating'],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
