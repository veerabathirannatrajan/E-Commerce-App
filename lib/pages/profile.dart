import 'package:e_com/pages/add-new-product.dart';
import 'package:e_com/pages/product_history_page.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // List of profile options
    final List<Map<String, String>> options = [
      {'title': 'My orders', 'subtitle': 'Already have 12 orders'},
      {'title': 'Shipping addresses', 'subtitle': '3 addresses'},
      {'title': 'Payment methods', 'subtitle': 'Visa **34'},
      {'title': 'Promocodes', 'subtitle': 'You have special promocodes'},
      {'title': 'My reviews', 'subtitle': 'Reviews for 4 items'},
      {'title': 'Settings', 'subtitle': 'Notifications, password'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: height * 0.12,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              Text(
                'My profile',
                style: TextStyle(
                  fontSize: width * 0.08,
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
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            children: [

              // User info
              Row(
                children: [
                  Container(
                    height: height * 0.12,
                    width: height * 0.12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/black.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Matilda Brown",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: width * 0.06,
                        ),
                      ),
                      Text(
                        "matildabrown@mail.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: width * 0.3,
                      vertical: height * 0.02,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil('/sign_up', (route) => false);
                },
                child: Text(
                  "LOG OUT",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: width * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),


              // Logout button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(20))
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddProductPage()),
                  );
                },
                child: Text(
                  "Add your own product",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: width * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),

              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(20))
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProductHistoryPage()),
                  );
                },
                child: Text(
                  "Manage products",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: width * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),



              // Options List
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: options.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.grey[300],
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: height * 0.015),
                    title: Text(
                      options[index]['title']!,
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      options[index]['subtitle']!,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: width * 0.04),
                    onTap: () {
                      // handle tap if needed
                    },
                  );
                },
              ),

              SizedBox(height: height * 0.05),


            ],
          ),
        ),
      ),
    );
  }
}
