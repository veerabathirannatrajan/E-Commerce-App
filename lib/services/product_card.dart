import 'package:e_com/pages/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String brand;
  final String image;
  final String price;
  final String tag;
  final String offer;
  final String rating;

  const ProductCard({
    super.key,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.tag,
    required this.offer,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cardWidth = screenWidth * 0.40;
    final cardHeight = screenWidth * 0.70;
    final imageHeight = cardHeight * 0.75;

    int ratingInt = int.tryParse(rating) ?? 0;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),

        // ================= NAVIGATION =================
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => product(
                name: name,
                brand: brand,
                image: image,
                price: price,
                offer: offer,
                rating: ratingInt,
              ),
            ),
          );
        },

        child: Container(
          height: cardHeight,
          width: cardWidth,
          padding: EdgeInsets.all(screenWidth * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= PRODUCT IMAGE =================
              SizedBox(
                height: imageHeight,
                width: cardWidth,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/$image'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // ================= OFFER TAG =================
                    Positioned(
                      top: screenWidth * 0.02,
                      left: screenWidth * 0.02,
                      child: Container(
                        height: screenWidth * 0.06,
                        width: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[500],
                        ),
                        child: Center(
                          child: Text(
                            '-$offer',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenWidth * 0.01),

              // ================= RATING =================
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      i < ratingInt ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: screenWidth * 0.045,
                    ),
                ],
              ),

              SizedBox(height: screenWidth * 0.005),

              // ================= BRAND =================
              Text(
                brand,
                style: TextStyle(
                  color: Colors.grey[700],
                  letterSpacing: 1,
                  fontSize: screenWidth * 0.03,
                ),
              ),

              // ================= PRODUCT NAME =================
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: screenWidth * 0.04,
                ),
              ),

              // ================= PRICE =================
              Text(
                '$price\$',
                style: TextStyle(
                  color: Colors.red[700],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
