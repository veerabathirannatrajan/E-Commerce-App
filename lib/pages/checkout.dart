import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final int orderAmount;

  const CheckoutPage({super.key, required this.orderAmount});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ================= APP BAR =================
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: screenHeight/15,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),

              // ================= SHIPPING ADDRESS =================
              Text(
                "Shipping address",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.012,
                    right: screenWidth * 0.05,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.07,
                    child: Text(
                      "Jane doe",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.06,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenHeight * 0.03,
                    left: screenWidth * 0.07,
                    child: Text(
                      "3 Newbridge Court\nChino Hills, CA 91709, United States",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),

              // ================= PAYMENT =================
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.012,
                    right: screenWidth * 0.05,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.02,
                    left: screenWidth * 0.02,
                    child: Text(
                      "Payment",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: screenWidth * 0.06,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.02,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: SizedBox(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.3,
                          child: Center(
                            child: Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.17,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/mastercard.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenHeight * 0.05,
                    left: screenWidth * 0.4,
                    child: Text(
                      "**** **** **** 3947",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.055,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),

              // ================= DELIVERY METHOD =================
              Text(
                "Delivery method",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: screenWidth * 0.06,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDeliveryCard('assets/images/fedex.png' ,screenWidth, screenHeight),
                    SizedBox(width: screenWidth * 0.04),
                    _buildDeliveryCard('assets/images/usps.png', screenWidth, screenHeight),
                    SizedBox(width: screenWidth * 0.04),
                    _buildDeliveryCard('assets/images/dhl.png',screenWidth, screenHeight),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // ================= ORDER DETAILS =================
              _buildOrderRow("Order: ", "${widget.orderAmount}\$", screenWidth),
              _buildOrderRow("Delivery: ", "15\$", screenWidth),
              _buildOrderRow("Total: ", "${widget.orderAmount + 15}\$", screenWidth),
              SizedBox(height: screenHeight * 0.03),

              // ================= SUBMIT BUTTON =================
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {},
                  child: Text(
                    "SUBMIT ORDER",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight/14,)
            ],
          ),
        ),
      ),
    );
  }

  // ================= DELIVERY CARD WIDGET =================
  Widget _buildDeliveryCard(String imagePath, double screenWidth, double screenHeight) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 0,
      child: Container(
        height: screenHeight * 0.13,
        width: screenWidth * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(imagePath,),
          fit:BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              color: Colors.white,
              child: Center(
                child: Text('2-3 days',style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22
                ),),
              ),
            )
             // Image.asset(imagePath, height: screenHeight * 0.07, fit: BoxFit.contain),

          ],
        ),
      ),
    );
  }

  // ================= ORDER ROW WIDGET =================
  Widget _buildOrderRow(String title, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
