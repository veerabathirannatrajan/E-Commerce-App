import 'package:e_com/pages/checkout.dart';
import 'package:e_com/services/cart_card.dart';
import 'package:e_com/services/cart_data.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int getTotalAmount() {
    int total = 0;
    for (final item in cartList) {
      final qty = item.quantity;
      total += item.price * qty;
    }
    return total;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {}

              ),
              const SizedBox(height: 10),
              const Text(
                'My Cart                          ',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                final item = cartList[index];
                return cartcard(
                  name: item.name,
                  brand: item.brand,
                  image: item.image,
                  price: item.price,
                  offer: item.offer,
                  size: item.size,
                  color: item.color,
                  quantity: item.quantity,

                  onIncrease: () {
                    setState(() {
                      item.quantity++;
                    });
                  },

                  onDecrease: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.quantity--;
                      }
                    });
                  },

                  onRemove: () {
                    setState(() {
                      cartList.removeAt(index);
                    });
                  },
                );

              },
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 60,
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your promo code",
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            border: InputBorder.none, // removes the default underline
                          ),
                          style: const TextStyle(fontSize: 18),
                          onChanged: (value) {
                            // Save promo code value here
                            // promoCode = value;
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: Material(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                          elevation: 4, // 👈 floating card effect
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              // 👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼favorite action
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        "${getTotalAmount()}\$",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: 180,
                    vertical: 20
                )
                ),


              ),
              //👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼 check out
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>CheckoutPage(
                      orderAmount: getTotalAmount(),
                    ),
                  ),
                );
              },

              child: Text("CHECK OUT",

                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),


              ),),



          ],
        ),
      ),
    );
  }
}
