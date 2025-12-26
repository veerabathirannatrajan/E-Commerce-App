import 'package:e_com/services/cart_data.dart';
import 'package:e_com/services/fav_card.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 120,
        automaticallyImplyLeading: false,

        title: Padding(
          padding: const EdgeInsets.only(left: 16, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ✅ FIX
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.search, size: 30, color: Colors.black),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Favorite',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),

      body: favList.isEmpty
          ? const Center(
        child: Text(
          "No favorites yet",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: favList.length,
        itemBuilder: (context, index) {
          final item = favList[index];

          return FavCard(
            name: item.name,
            brand: item.brand,
            image: item.image,
            price: item.price,
            offer: item.offer,
            size: item.size,
            color: item.color,
            quantity: item.quantity,
            onRemove: () {
              setState(() {
                favList.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
