import 'package:flutter/material.dart';
import 'package:e_com/services/dio_service.dart';
import 'package:e_com/services/convert_2_data.dart';
import 'package:e_com/services/product_card-from-db.dart';
import 'package:e_com/pages/add-new-product.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
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
      backgroundColor: Colors.grey[50],



      body: FutureBuilder<List<Product>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
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
                      onPressed: () {
                        setState(() {
                          productsFuture = ApiService.fetchProducts();
                        });
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }


          final products = snapshot.data ?? [];

          if (products.isEmpty) {
            return const Center(
              child: Text(
                'No products found',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return CustomScrollView(
            slivers: [

              // ================= HERO SECTION =================
              SliverToBoxAdapter(
                child: Stack(
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
                    Container(
                      height: height * 0.35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.04,
                      left: width * 0.05,
                      right: width * 0.05,
                      child: Text(
                        'Street clothes',
                        style: TextStyle(
                          fontSize: width * 0.13,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          color: Colors.white,
                          height: 0.9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ================= PRODUCT GRID =================
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final p = products[index];
                      return ProductCard(
                        name: p.name,
                        brand: p.brand,
                        imageUrl: p.images.isNotEmpty ? p.images.first : '',
                        price: p.price.toString(),
                        tag: 'NEW',
                        offer: p.offer,
                        rating: p.rating.toString(),
                      );
                    },
                    childCount: products.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
