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



  int getTotalAmount(List<CartItem> cartList) {
    return cartList.fold(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        toolbarHeight: screenHeight * 0.15,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            top: screenHeight * 0.015,
          ),
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
                onPressed: () {},
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
    child: ValueListenableBuilder<List<CartItem>>(
      valueListenable: cartListNotifier,
      builder: (context, cartList, _) {

        final totalAmount = getTotalAmount(cartList);

        return Column(
          children: [

            // ================= CART ITEMS =================
            if (cartList.isEmpty)
              const Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
              )
            else
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
                      final list = List<CartItem>.from(cartList);
                      list[index].quantity++;
                      cartListNotifier.value = list;
                    },

                    onDecrease: () {
                      if (item.quantity > 1) {
                        final list = List<CartItem>.from(cartList);
                        list[index].quantity--;
                        cartListNotifier.value = list;
                      }
                    },

                    onRemove: () {
                      final list = List<CartItem>.from(cartList);
                      list.removeAt(index);
                      cartListNotifier.value = list;
                    },
                  );
                },
              ),

            // ================= PROMO =================
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
                child: Container(
                  height: screenHeight * 0.075,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your promo code",
                            hintStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.grey
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.arrow_forward,
                        size: 30,),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= TOTAL =================
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Amount:",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                  Text(
                    "$totalAmount\$",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            // ================= CHECKOUT =================
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.30,
                  vertical: screenHeight * 0.025,
                ),
              ),
              onPressed: cartList.isEmpty
                  ? null
                  : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        CheckoutPage(orderAmount: totalAmount),
                  ),
                );
              },
              child: const Text(
                "CHECK OUT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        );
      },
    ),
    ),

    );
  }
}
