import 'package:e_com/pages/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String brand;
  final String image;
  final String price;
  final String tag;
  final String offer;
  final String  rating;


  const ProductCard({
    super.key,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.tag,
    required this.offer,
    required this.rating
  });




  @override
  Widget build(BuildContext context) {
    int ratingInt = int.tryParse(rating) ?? 0;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),

        // 👇🏼👇🏼👇🏼👇🏼 on tap
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => product(
                name: name,
                brand: brand,
                image: image,
                price: price,
                offer: offer,
                rating: int.tryParse(rating) ?? 0,
              ),
            ),
          );

        },

        child: Container(
          height: 266,
          width: 150,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                  height: 260,
                  width: 150,

                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage('assets/images/$image',),
                          fit:BoxFit.cover
                          ),
                        ),

                      ),
                      Positioned(
                      top: 8,
                      left:10 ,

                      child: Container(
                        height: 24,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[500]
                        ),
                        child: Center(child: Text('-$offer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 15
                          ),
                        )
                        ),

                      )
                      ),
                    ],
                  )
              ),

        Row(
                children: [
                  for(int i = 0 ; i < 5 ; i ++ )
                    Icon(
                      i<ratingInt? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                    ),
                ],
              ),


              Text(name,
                  style: TextStyle(
                  color: Colors.grey[700],
                  letterSpacing: 1,
                  fontSize: 10
                  ),
              ),
              Text(brand,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 15
                ),
              ),
              Text('$price\$',
                style: TextStyle(
                    color: Colors.red[700],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 15
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
