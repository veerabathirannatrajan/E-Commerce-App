import 'package:e_com/services/convert_2_data.dart';
import 'package:e_com/services/dio_service.dart';
import 'package:e_com/services/product_card.dart';
import 'package:flutter/material.dart';

class main2 extends StatefulWidget {
  const main2({super.key});

  @override
  State<main2> createState() => _main2State();
}

class _main2State extends State<main2> {

  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }
  void loadProducts()
  {
    productsFuture = ApiService.fetchProducts();
  }



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

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    "Super summer sale!",
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.grey[600],
                      letterSpacing: 1,
                    ),
                  ),
                ),

                SizedBox(width: width/2.5,),

                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      elevation: WidgetStatePropertyAll(0),
                    ),

                    onPressed: () {
                      setState(() {
                        productsFuture = ApiService.fetchProducts();
                      });
                    },
                    child:  Icon(Icons.refresh,
                      color: Colors.red,
                      size: 30,)
                ),


              ],
            ),
            /// FIRST PRODUCT LIST
            FutureBuilder(future: productsFuture,
                builder: (context,snapshot){
                  if (snapshot.connectionState== ConnectionState.waiting)
                  {
                    return Center(child: CircularProgressIndicator(color: Colors.red,),);
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wifi_off,
                              size: 60,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              snapshot.error.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.grey)
                              ),
                              onPressed: () {
                                setState(() {
                                  productsFuture = ApiService.fetchProducts();
                                });
                              },
                              child: const Text('Retry',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final prod = snapshot.data ?? [];

                  if (prod.isEmpty)
                  {
                    return Center(
                      child: Text('No product found'),
                    );
                  }

                  return  SizedBox(
                    height: width * 0.9,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: prod.length,
                      itemBuilder: (context, index) {
                        final p = prod[index];
                        return Padding(
                          padding: EdgeInsets.only(left: width * 0.04),
                          child: ProductCard(
                            name: p.name,
                            brand: p.brand,
                            image: p.images.isNotEmpty ? p.images.first : '',
                            price: p.price.toString(),
                            tag: 'NEW',
                            offer: p.offer,
                            rating: p.rating.toString(),
                          ),
                        );
                      },
                    ),
                  );



                }),


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
            FutureBuilder(future: productsFuture,
                builder: (context,snapshot){
                  if (snapshot.connectionState== ConnectionState.waiting)
                  {
                    return Center(child: CircularProgressIndicator(color: Colors.red,),);
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wifi_off,
                              size: 60,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              snapshot.error.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.grey)
                              ),
                              onPressed: () {
                                setState(() {
                                  productsFuture = ApiService.fetchProducts();
                                });
                              },
                              child: const Text('Retry',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final prod = snapshot.data ?? [];

                  if (prod.isEmpty)
                  {
                    return Center(
                      child: Text('No product found'),
                    );
                  }

                  return  SizedBox(
                    height: width * 0.9,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: prod.length,
                      itemBuilder: (context, index) {
                        final p = prod[index];
                        return Padding(
                          padding: EdgeInsets.only(left: width * 0.04),
                          child: ProductCard(
                            name: p.name,
                            brand: p.brand,
                            image: p.images.isNotEmpty ? p.images.first : '',
                            price: p.price.toString(),
                            tag: 'NEW',
                            offer: p.offer,
                            rating: p.rating.toString(),
                          ),
                        );
                      },
                    ),
                  );



                }),


          ],
        ),
      ),
    );
  }
}
