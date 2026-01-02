import 'package:flutter/material.dart';
import 'package:e_com/services/dio_service.dart';
import 'package:e_com/services/convert_2_data.dart';

class EditProductPage extends StatefulWidget {
  final Product product;
  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController brandCtrl;
  late TextEditingController nameCtrl;
  late TextEditingController priceCtrl;
  late TextEditingController offerCtrl;
  late TextEditingController ratingCtrl;
  late TextEditingController imageCtrl;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    brandCtrl = TextEditingController(text: p.brand);
    nameCtrl = TextEditingController(text: p.name);
    priceCtrl = TextEditingController(text: p.price.toString());
    offerCtrl = TextEditingController(text: p.offer);
    ratingCtrl = TextEditingController(text: p.rating.toString());
    imageCtrl = TextEditingController(text: p.images.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _field('Brand', brandCtrl),
            _field('Name', nameCtrl),
            _field('Price', priceCtrl, TextInputType.number),
            _field('Offer', offerCtrl),
            _field('Rating', ratingCtrl, TextInputType.number),
            _field('Image URL', imageCtrl),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _updateProduct,
              child: const Text('UPDATE'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController c,
      [TextInputType type = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    await ApiService.updateProduct(widget.product.id, {
      "brand": brandCtrl.text,
      "name": nameCtrl.text,
      "price": int.parse(priceCtrl.text),
      "offer": offerCtrl.text,
      "rating": int.parse(ratingCtrl.text),
      "images": [imageCtrl.text],
    });

    Navigator.pop(context);
  }
}
