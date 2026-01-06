import 'package:flutter/material.dart';
import 'package:e_com/services/dio_service.dart';
import 'package:e_com/services/convert_2_data.dart';
import 'edit_product_page.dart';

class ProductHistoryPage extends StatefulWidget {
  const ProductHistoryPage({super.key});

  @override
  State<ProductHistoryPage> createState() => _ProductHistoryPageState();
}

class _ProductHistoryPageState extends State<ProductHistoryPage> {
  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    productsFuture = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('My Products')),
      body: FutureBuilder<List<Product>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final products = snapshot.data ?? [];

          return ListView.builder(

            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];

              return Card(
                color: Colors.grey[100],
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    p.images.first,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(p.name),
                  subtitle: Text('${p.brand}  •  \$${p.price}'),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditProductPage(product: p),
                            ),
                          );
                          setState(loadProducts);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Delete product'),
                              content: const Text('Are you sure?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, true),
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true) {
                            await ApiService.deleteProduct(p.id);
                            setState(loadProducts);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
