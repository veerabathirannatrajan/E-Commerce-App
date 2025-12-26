import 'package:flutter/material.dart';

class cartcard extends StatefulWidget {
  final String name;
  final String brand;
  final String image;
  final int price;
  final String offer;
  final String size;
  final String color;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;


  const cartcard({
    super.key,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.offer,
    required this.size,
    required this.color,
    required this.quantity,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,

  });

  @override
  State<cartcard> createState() => _cartcardState();
}

class _cartcardState extends State<cartcard> {

  int prod_count = 1;

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.all(12),
      height: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),

            child: Row(
              children: [
                Container(
                  height: 220,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${widget.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(widget.brand,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.grey)),
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text("color: ",
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey)),
                            Text(widget.color,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Row(
                          children: [
                            Text("color:",
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey)),
                            Text(widget.size,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          elevation: 3, // 👈 floating card effect
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: widget.onDecrease,


                            child:  Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.remove, color: Colors.grey,size: 30,),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(widget.quantity.toString(),
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)
                        ),
                        SizedBox(width: 20,),


                        Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          elevation: 3, // 👈 floating card effect
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap:widget.onIncrease,
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.add, color: Colors.grey,size: 30,),
                            ),
                          ),
                        ),


                      ],
                    ),


                  ],
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 30,
            right: 25,
            child: Text("\$${widget.price * widget.quantity}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)
            ),
          ),

          Positioned(
            top: 0,
            right: 5,
            child: IconButton(
              onPressed:widget.onRemove,
                icon: Icon(Icons.close_outlined,
                size: 40,
                color: Colors.grey[600],),

            ) ,
          ),





        ],
      ),
    );
  }
}
