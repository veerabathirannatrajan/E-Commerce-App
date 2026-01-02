import 'package:e_com/services/cart_data.dart';
import 'package:flutter/material.dart';

class FavCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;

  const FavCard({
    super.key,
    required this.item,
    required this.onRemove,
  });

  void addToCart(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final list = List<CartItem>.from(cartListNotifier.value);

    list.add(
      CartItem(
        name: item.name,
        brand: item.brand,
        image: item.image,
        price: item.price,
        offer: item.offer,
        size: item.size,
        color: item.color,
        quantity: 1,
      ),
    );

    cartListNotifier.value = list;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Added to cart",
          style: TextStyle(color: Colors.black, fontSize: width * 0.04),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.12, vertical: height * 0.02),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.015),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey[100],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    ImageProvider imgurl(String imageUrl) {
      if (imageUrl.isEmpty) {
        return const AssetImage('assets/images/loading.png');
      }

      if (imageUrl.startsWith('http')) {
        return NetworkImage(imageUrl);
      }

      return AssetImage('assets/images/$imageUrl');
    }

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(w * 0.03),
      height: h * 0.18,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              // IMAGE
              Container(
                width: w * 0.35,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: imgurl(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: w * 0.04),

              // DETAILS
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.brand,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: w * 0.02),
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: w * 0.02),

                      Row(
                        children: [
                          Text("Color: ",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey)),
                          Text(item.color,
                              style: const TextStyle(fontSize: 18)),
                          SizedBox(width: w * 0.04),
                          Text("Size: ",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey)),
                          Text(item.size,
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // PRICE
          Positioned(
            bottom: h * 0.02,
            right: w * 0.04,
            child: Text(
              "\$${item.price}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Positioned(
            top: h * 0.015,
            right: w * 0.03,
            child: PopupMenuButton<String>(
              color: Colors.white,
              icon: Icon(
                Icons.more_vert,
                size: w * 0.07,
                color: Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onSelected: (value) {
                if (value == 'cart') {
                  addToCart(context);
                } else if (value == 'remove') {
                  onRemove();
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(

                  value: 'cart',
                  child: Row(
                    children: [
                      Icon(Icons.add_shopping_cart,
                          color: Colors.grey, size: w * 0.05),
                      SizedBox(width: w * 0.03),
                      Text("Add to Cart",
                          style: TextStyle(fontSize: w * 0.04)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'remove',
                  child: Row(
                    children: [
                      Icon(Icons.delete,
                          color: Colors.red, size: w * 0.05),
                      SizedBox(width: w * 0.03),
                      Text(
                        "Remove",
                        style: TextStyle(
                            fontSize: w * 0.04, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
