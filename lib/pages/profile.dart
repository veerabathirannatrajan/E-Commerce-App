import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_com/services/auth_service.dart';
import 'package:e_com/pages/add-new-product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/pages/product_history_page.dart';
import 'package:firebase_storage/firebase_storage.dart';


class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  Map<String, dynamic>? userData;
  bool isLoading = true;
  int? age;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      final data = doc.data()!;

      setState(() {
        userData = data;
        profileImageUrl = data['profileImage'];
        age = _calculateAge(data['dob']); // ✅ FIXED
        isLoading = false;
      });
    }
  }
  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickAndUpload(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                _pickAndUpload(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  String? profileImageUrl;
  bool isUploading = false;

  Future<void> _pickAndUpload(ImageSource source) async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 70,
      maxWidth: 1024,
    );

    if (image == null) return;

    setState(() => isUploading = true);

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final file = File(image.path);

    final ref = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child('${userData!['uid']}')
        .child('${userData!['name']}.jpg');

    await ref.putFile(file);

    final url = await ref.getDownloadURL();

    // 🔥 Save URL in Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({
      'profileImage': url,
    }, SetOptions(merge: true));

    setState(() {
      profileImageUrl = url;
      isUploading = false;
    });
  }

  Future<void> loadProfileImage() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (doc.exists && doc.data()!.containsKey('profileImage')) {
      setState(() {
        profileImageUrl = doc['profileImage'];
      });
    }
  }




  int _calculateAge(String dob) {
    DateTime birthDate = DateFormat('dd-MM-yyyy').parse(dob);
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }



  Widget _userInfo(double width, double height) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    if (userData == null) {
      return const Text("User data not found");
    }

    return Row(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.grey[300],
          backgroundImage: profileImageUrl != null
              ? NetworkImage(profileImageUrl!)
              : AssetImage('assets/images/loading.png') as ImageProvider,
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.black),
              onPressed: () => _showImagePicker(),
            ),
          ),
        ),

        SizedBox(width: width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData!['name'],
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: width * 0.06,
              ),
            ),
            Text(
              userData!['email'],
              style: TextStyle(
                color: Colors.grey,
                fontSize: width * 0.045,
              ),
            ),
            Row(
              children: [
                Text(
                  "Age: $age",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: width * 0.05),
                Text(
                  "Gender: ${userData!['gender']}",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }



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

              _userInfo(width, height),



              SizedBox(height: height * 0.04),
              ElevatedButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  fixedSize: WidgetStatePropertyAll(Size(400,70)),

                ),
                onPressed: () async {
                  await AuthService().logout();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                        (route) => false,
                  );
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
                  fixedSize: WidgetStatePropertyAll(Size(400,70)),
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
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
                  fixedSize: WidgetStatePropertyAll(Size(400,70)),
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
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
