import 'package:e_com/services/cart_data.dart';
import 'package:e_com/services/fav_card.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.15,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            top: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.search, size: 30),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Favorite',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),

      body: ValueListenableBuilder<List<CartItem>>(
        valueListenable: favListNotifier,
        builder: (context, favList, _) {
          if (favList.isEmpty) {
            return const Center(
              child: Text(
                "No favorites yet",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            itemCount: favList.length,
            itemBuilder: (context, index) {
              final item = favList[index];

              return FavCard(
                item: item,
                onRemove: () {
                  final list = List<CartItem>.from(favList);
                  list.removeAt(index);
                  favListNotifier.value = list;
                },
              );
            },
          );
        },
      ),
    );
  }
}
