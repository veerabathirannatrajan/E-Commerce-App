import 'package:flutter/material.dart';
import 'package:e_com/services/dio_service.dart';
import 'package:e_com/services/convert_2_data.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final brandCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final offerCtrl = TextEditingController();
  final ratingCtrl = TextEditingController();
  final imageCtrl = TextEditingController();

  bool loading = false;
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
      title: const Text('Add Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _field('Brand', brandCtrl),
            _field('Dress Name', nameCtrl),
            _field('Price', priceCtrl, TextInputType.number),
            _field('Offer', offerCtrl),
            _field('Rating (1–5)', ratingCtrl, TextInputType.number),
            _field('Image URL', imageCtrl),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ButtonStyle(

                backgroundColor: MaterialStatePropertyAll(Colors.red),
                fixedSize: WidgetStatePropertyAll(Size(300,70)),

              ),
              onPressed: loading ? null : _submit,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('ADD PRODUCT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),
            ),

            const SizedBox(height: 16),

            if (status.isNotEmpty)
              Text(
                status,
                style: TextStyle(
                  color: status.contains('success')
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _field(
      String label,
      TextEditingController controller, [
        TextInputType type = TextInputType.text,
      ]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (brandCtrl.text.isEmpty ||
        nameCtrl.text.isEmpty ||
        priceCtrl.text.isEmpty ||
        offerCtrl.text.isEmpty ||
        ratingCtrl.text.isEmpty ||
        imageCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      loading = true;
      status = '';
    });

    try {
      final product = Product(
        id: '',
        brand: brandCtrl.text,
        name: nameCtrl.text,
        price: int.parse(priceCtrl.text),
        offer: offerCtrl.text,
        rating: int.parse(ratingCtrl.text),
        images: [imageCtrl.text],
      );

      await ApiService.addProduct(product);

      setState(() {
        status = 'success: product added';
      });

      brandCtrl.clear();
      nameCtrl.clear();
      priceCtrl.clear();
      offerCtrl.clear();
      ratingCtrl.clear();
      imageCtrl.clear();

    } catch (e) {
      setState(() {
        status = 'error: failed to add product';
      });
    } finally {
      setState(() => loading = false);
    }
  }
}
