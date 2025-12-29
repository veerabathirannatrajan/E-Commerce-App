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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return Container(
      margin: EdgeInsets.all(w * 0.005),
      height: h * 0.23,
      padding: EdgeInsets.all(w * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(w * 0.04),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(w * 0.04),
            ),
            child: Row(
              children: [
                // IMAGE
                Container(
                  width: w * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(w * 0.04),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${widget.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: w * 0.04),

                // DETAILS
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.015),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.brand,
                          style: TextStyle(
                              fontSize: w * 0.04, color: Colors.grey),
                        ),
                        SizedBox(height: h * 0.005),
                        Text(
                          widget.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: h * 0.01),

                        // COLOR & SIZE
                        Row(
                          children: [
                            Text("Color: ",
                                style: TextStyle(
                                    fontSize: w * 0.04,
                                    color: Colors.grey)),
                            Text(widget.color,
                                style:
                                TextStyle(fontSize: w * 0.04)),
                            SizedBox(width: w * 0.04),
                            Text("Size: ",
                                style: TextStyle(
                                    fontSize: w * 0.04,
                                    color: Colors.grey)),
                            Text(widget.size,
                                style:
                                TextStyle(fontSize: w * 0.04)),
                          ],
                        ),

                        SizedBox(height: h * 0.015),

                        // QUANTITY
                        Row(
                          children: [
                            _qtyButton(
                              icon: Icons.remove,
                              onTap: widget.onDecrease,
                              size: w/1.3,
                            ),
                            SizedBox(width: w * 0.04),
                            Text(
                              widget.quantity.toString(),
                              style: TextStyle(
                                  fontSize: w * 0.065,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: w * 0.04),
                            _qtyButton(
                              icon: Icons.add,
                              onTap: widget.onIncrease,
                              size: w/1.3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // PRICE
          Positioned(
            bottom: h * 0.035,
            right: w * 0.05,
            child: Text(
              "\$${widget.price * widget.quantity}",
              style: TextStyle(
                  fontSize: w * 0.07,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // REMOVE
          Positioned(
            top: h * 0.005,
            right: w * 0.02,
            child: IconButton(
              onPressed: widget.onRemove,
              icon: Icon(
                Icons.close_outlined,
                size: w * 0.07,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onTap,
    required double size,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(size * 0.1),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(size * 0.1),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(size * 0.025),
          child: Icon(icon, size: size * 0.07, color: Colors.grey),
        ),
      ),
    );
  }
}
