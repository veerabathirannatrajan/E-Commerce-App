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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Checkout",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [



          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shipping address",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),

                SizedBox(height: 20,),
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 465,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                    ),

                    Positioned(
                      top: 5,
                      right: 20,
                      child: TextButton(
                        //👇🏼👇🏼👇🏼 change
                        onPressed: (){

                        },
                          child: Text("Change",
                            style: TextStyle(

                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                      ),
                    ),

                    Positioned(
                      top: 20,
                      left: 45,

                      child:Text("Jane doe",
                      style: TextStyle(

                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 30
                      ),
                    ),
                    ),

                    Positioned(
                      bottom: 30,
                      left: 45,

                      child:Text("3 Newbridge Court\nChino Hills, CA 91709, United States",
                        style: TextStyle(

                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),


                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 465,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100]
                      ),
                    ),

                    Positioned(
                      top: 5,
                      right: 20,
                      child: TextButton(
                        //👇🏼👇🏼👇🏼 change
                        onPressed: (){

                        },
                        child: Text("Change",
                          style: TextStyle(

                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      left: 5,

                      child:Text("Payment",
                        style: TextStyle(

                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 30
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      left: 5,

                      child:Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 100,
                        child: SizedBox(
                          height: 80,
                          width: 130,
                          child: Container(
                            decoration: BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/mastercard.png'),
                                  fit: BoxFit.contain),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),

                                ),

                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                    Positioned(
                      bottom: 30,
                      left: 150,

                      child:Text("**** **** **** 3947",
                        style: TextStyle(

                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 30
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),
                Divider(
                  thickness: 1,
                  color: Colors.grey,

                ),
                SizedBox(height: 15,),


                Stack(
                  children: [
                    Container(
                      height: 180,
                      width: 465,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100]
                      ),
                    ),


                    Positioned(
                      top: 0,
                      left: 5,

                      child:Text("Delivery method",
                        style: TextStyle(

                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 30
                        ),
                      ),
                    ),

                    Positioned(
                        bottom: 0,
                        left: 5,

                        child:Row(
                          children: [
                            Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 100,
                              child: SizedBox(
                                height: 100,
                                width: 130,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(

                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),

                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 70,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage('assets/images/fedex.png'),
                                                fit: BoxFit.fill),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),

                                          ),

                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 5,
                                      left: 30,

                                      child:Text("2-3 days",
                                        style: TextStyle(

                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 25,),

                            Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 100,
                              child: SizedBox(
                                height: 100,
                                width: 130,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(

                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),

                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 70,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage('assets/images/usps.png'),
                                                fit: BoxFit.fill),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),

                                          ),

                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 5,
                                      left: 30,

                                      child:Text("2-3 days",
                                        style: TextStyle(

                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 25,),

                            Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 100,
                              child: SizedBox(
                                height: 100,
                                width: 130,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(

                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),

                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 70,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage('assets/images/dhl.png'),
                                                fit: BoxFit.fill),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),

                                          ),

                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 5,
                                      left: 30,

                                      child:Text("2-3 days",
                                        style: TextStyle(

                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),



                          ],
                        )
                    ),

                  ],
                ),

                SizedBox(height: 60,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order: ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),),

                    Text("${widget.orderAmount}\$",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                  ],
                ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Delivery: ",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),),

          Text("15\$",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total: ",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),),

          Text("${widget.orderAmount + 15}\$",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),),
        ],
      ),


                SizedBox(height: 30,),






                /// ✅ SUBMIT BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // submit order logic
                    },
                    child: const Text(
                      "SUBMIT ORDER",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
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
