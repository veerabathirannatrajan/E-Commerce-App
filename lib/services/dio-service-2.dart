import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.escuelajs.co/api/v1',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<Map<String, dynamic>> getprod(int id) async {
    final res = await dio.get('/products/$id');
    return res.data;
  }

  static Future<Map<String, dynamic>> postprod() async {
    final res = await dio.post('/products', data: {
      "title": "sxdcfgtvnhjukim,",
      "price": 23456789,
      "description": "dcrtfvgbynhujmkv",
      "categoryId": 1,
      "images": ["https://placehold.co/600x400"]
    });
    return res.data;
  }

  static Future<Map<String, dynamic>> putprod(int id) async {
    final res = await dio.put('/products/$id', data: {
      "title": "veera Product Updated",
      "price": 1000,
      "description": "Updated from Flutter",
      "categoryId": 1,
      "images": ["https://placehold.co/600x400"]
    });
    return res.data;
  }

  static Future<void> delprod(int id) async {
    await dio.delete('/products/$id');
  }
}

class api2 extends StatefulWidget {
  const api2({super.key});

  @override
  State<api2> createState() => _api2State();
}

class _api2State extends State<api2> {
  late Future<Map<String, dynamic>> productFuture;

  @override
  void initState() {
    super.initState();
    productFuture = Api.getprod(id);
  }


  int id = 89;
  Map<String, dynamic>? resultData;
  String action = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text('GET', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              FutureBuilder<Map<String, dynamic>>(
                future: productFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  final p = snapshot.data!;
                  return Text("""
                      id : ${p['id']}
                      title : ${p['title']}
                      price : ${p['price']}
                      description : ${p['description']}
                      image : ${p['images'][0]}
                      """);
                },
              ),


              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  final p = await Api.postprod();
                  setState(() {
                    id = p['id'];
                    resultData = p;
                    action = 'POST';
                    productFuture = Api.getprod(id);
                  });
                },

                child: const Text('POST'),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  final p = await Api.putprod(id);
                  setState(() {
                    resultData = p;
                    action = 'PUT';
                    productFuture = Api.getprod(id);
                  });
                },

                child: const Text('PUT'),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  await Api.delprod(id);
                  setState(() {
                    resultData = null;
                    action = 'DELETE';
                  });
                },
                child: const Text('DELETE'),
              ),

              const SizedBox(height: 20),

              if (action == 'DELETE')
                const Text(
                  'DELETE success',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

              if (resultData != null)
                Text("""
                      $action RESULT
                      id : ${resultData!['id']}
                      title : ${resultData!['title']}
                      price : ${resultData!['price']}
                      description : ${resultData!['description']}
                      image : ${resultData!['images'][0]}
                      """, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
