import 'package:dio/dio.dart';
import 'package:e_com/pages/api_test.dart';
import 'package:e_com/services/convert_2_data.dart';
import 'package:e_com/services/dio-service-2.dart';
import 'package:e_com/services/dio_service.dart';
import 'package:e_com/services/product_card.dart';
import 'package:e_com/services/product_card-from-db.dart';

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  final VoidCallback onViewAll;

  const home({super.key, required this.onViewAll});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }
  void loadProducts()
  {
    productsFuture = ApiService.fetchProducts();
  }



   Future<Map<String, dynamic>>getweather(String city) async{
     final dio =  Dio();
     try{
       final response = await dio.get(
           'https://api.openweathermap.org/data/2.5/weather',
           queryParameters: {
             'q': city,
             'appid': '92fff7865fd10c6368cc594957422c2d',
             // replace with your key
             'units': 'metric',
           });
       return response.data;
     }
     catch (e)
     {
       throw Exception('error : $e');
     }
   }


   Stream<DateTime> time() async* {
      while(true)
      {
        await Future.delayed(Duration(seconds: 1));
        yield DateTime.now();
      }
   }



   @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.55,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: height * 0.3,
                  left: width * 0.05,
                  child: Text(
                    'Fashion',
                    style: TextStyle(
                      fontSize: width * 0.15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),

                Positioned(
                  top: height * 0.36,
                  left: width * 0.05,
                  child: Text(
                    'Sale',
                    style: TextStyle(
                      fontSize: width * 0.15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),

                Positioned(
                  top: height * 0.45,
                  left: width * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.18,
                        vertical: height * 0.02,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed('/check');
                    },
                    child: Text(
                      "Check",
                      style: TextStyle(
                        fontSize: width * 0.05,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),

            /// ================= NEW HEADER =================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New",
                    style: TextStyle(
                      fontSize: width * 0.12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ApiTest()),
                      );

                    },
                    style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(0),
                      backgroundColor: WidgetStatePropertyAll(Colors.grey[100])
                    ),
                    child: Text(
                      "View all",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.grey[850],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    "You’ve never seen it before!",
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.grey[600],
                      letterSpacing: 1,
                    ),
                  ),
                ),

                SizedBox(width: width/4.6,),

                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    elevation: WidgetStatePropertyAll(0),
                  ),

                  onPressed: () {
                    setState(() {
                      productsFuture = ApiService.fetchProducts();
                    });
                  },
                  child:  Icon(Icons.refresh,
                  color: Colors.red,
                  size: 30,)
                ),


              ],
            ),

            SizedBox(height: height * 0.02),

            FutureBuilder(future: productsFuture,
                builder: (context,snapshot){
                  if (snapshot.connectionState== ConnectionState.waiting)
                    {
                      return Center(child: CircularProgressIndicator(color: Colors.red,),);
                    }
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wifi_off,
                              size: 60,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              snapshot.error.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(Colors.grey)
                              ),
                              onPressed: () {
                                setState(() {
                                  productsFuture = ApiService.fetchProducts();
                                });
                              },
                              child: const Text('Retry',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final prod = snapshot.data ?? [];

                  if (prod.isEmpty)
                    {
                      return Center(
                        child: Text('No product found'),
                      );
                    }

                  return  SizedBox(
                    height: width * 0.9,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: prod.length,
                      itemBuilder: (context, index) {
                        final p = prod[index];
                        return Padding(
                          padding: EdgeInsets.only(left: width * 0.04),
                          child: ProductCard(
                            name: p.name,
                            brand: p.brand,
                            image: p.images.isNotEmpty ? p.images.first : '',
                            price: p.price.toString(),
                            tag: 'NEW',
                            offer: p.offer,
                            rating: p.rating.toString(),
                          ),
                        );
                      },
                    ),
                  );



                }),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.18,
                    vertical: height * 0.02,
                  ),
                ),
                onPressed: widget.onViewAll,
                child: Text(
                  "View all sale",
                  style: TextStyle(
                    fontSize: width * 0.05,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),



            SizedBox(height: height * 0.05),

            Center(
              child: ElevatedButton(

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const api2()),
                  );

                },
                style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(Colors.grey[100])
                ),
                child: Text(

                  "API 2",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.grey[850],
                  ),
                ),
              ),
            ),

            Center(
              child: SizedBox(
                height: height/6,
                child: FutureBuilder(future: getweather('chennai'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      final city = data['name'];
                      final temp = data['main']['temp'];
                      final description = data['weather'][0]['description'];

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            city,
                            style:  TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '$temp \' C',
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(height: 5),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),

                          SizedBox(height: 20,),
                          StreamBuilder(stream: time(),
                              builder: (context,snapshot){

                                if(!snapshot.hasData)
                                {
                                  return Text("time : ${snapshot.data}");
                                }

                                final time = snapshot.data!;

                                return Text('${time.hour}:${time.minute}:${time.second}');



                              }),
                          SizedBox(height: 20,),




                        ],
                      );
                    }

                    return const Text('No data');
                  },
                ),

              ),
            ),

            SizedBox(height: height * 0.05),


          ],
        ),
      ),
    );
  }
}
