import 'package:e_com/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  bool _obscurePassword = true;

  String? password;
  String? name;
  String? email;
  String? dob; // Date of Birth (stored as String)
  DateTime? selectedDob;
  String? selectedGender;

  final List<String> genderList = [
    "Male",
    "Female",
    "Other",
  ];

  bool isEmailValid = false;


  Future<void> _pickDateOfBirth() async {
    DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18), // default 18 years old
      firstDate: DateTime(1950),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        selectedDob = picked;
        dob = DateFormat('dd-MM-yyyy').format(picked); // ✅ STRING
      });
    }
  }


  bool checkEmail(String value) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value.trim());
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: height / 8,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: width * 0.06,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: width * 0.12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              children: [
                SizedBox(height: height / 15),

                // NAME
                Container(
                  width: width * 0.9,
                  height: height / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: width * 0.045),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: width * 0.035,
                        height: 0.8,
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: width * 0.045,
                      ),
                      prefixIcon: Icon(Icons.person, size: width * 0.07),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.018,
                      ),
                    ),
                    onChanged: (value) => name = value,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      if (value.trim().length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: height / 80),

                // EMAIL
                Container(
                  width: width * 0.9,
                  height: height / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: width * 0.035,
                        height: 0.8,
                      ),
                      suffixIcon: Icon(
                        isEmailValid ? Icons.check : Icons.close,
                        color: isEmailValid ? Colors.green : Colors.red,
                        size: width * 0.07,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: width * 0.045,
                      ),
                      prefixIcon: Icon(Icons.mail_outlined, size: width * 0.07),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.018,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                        isEmailValid = checkEmail(value);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!checkEmail(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: height / 80),

                // PASSWORD
                Container(
                  width: width * 0.9,
                  height: height / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: TextFormField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: width * 0.035,
                        height: 0.8,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: width * 0.045,
                      ),
                      prefixIcon: Icon(Icons.password_sharp, size: width * 0.07),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: width * 0.07,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.018,
                      ),
                    ),
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      ).hasMatch(value)) {
                        return 'Password must contain A-Z, a-z, 0-9 & special char';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: height / 80),

                // DATE OF BIRTH
                Container(
                  width: width * 0.9,
                  height: height / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: InkWell(
                    onTap: _pickDateOfBirth,
                    child: IgnorePointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Date of Birth",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: width * 0.045,
                          ),
                          prefixIcon: Icon(Icons.calendar_today, size: width * 0.06),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.018,
                          ),
                        ),
                        controller: TextEditingController(text: dob ?? ""),
                        validator: (value) {
                          if (dob == null) {
                            return "Date of birth is required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 80),
                // GENDER DROPDOWN
                Container(
                  width: width * 0.9,
                  height: height / 14,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // ✅ white background
                    borderRadius: BorderRadius.circular(10), // ✅ rounded edge
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    value: selectedGender,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    icon: Icon(Icons.arrow_drop_down, size: width * 0.07),
                    hint: Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: width * 0.045,
                      ),
                    ),
                    items: genderList.map((gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(
                          gender,
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select your gender";
                      }
                      return null;
                    },
                  ),
                ),




                SizedBox(height: height / 80),

                // ALREADY HAVE ACCOUNT
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Already have account ?",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.037,
                        ),
                      ),
                      SizedBox(width: width / 50),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.red, size: width * 0.06),
                      ),
                      SizedBox(width: width / 50),
                    ],
                  ),
                ),

                SizedBox(height: height / 25),

                // SIGN UP BUTTON
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    const MaterialStatePropertyAll(Colors.red),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: width * 0.35,
                        vertical: height * 0.02,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await AuthService().signUp(
                          name: name!,
                          email: email!,
                          password: password!,
                          dob: dob!,
                          gender: selectedGender!,

                        );


                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account created successfully")),
                        );

                        // Go to main screen
                        Navigator.pushReplacementNamed(context, '/main');

                      } catch (e) {
                        // Clean error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
                        );
                      }
                    }
                  },


                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: width * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: height / 8),

                // SOCIAL LOGIN
                Text(
                  "Or login with social account",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: width * 0.045,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height / 60),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // GOOGLE
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => print("Google login"),
                        child: Container(
                          height: height / 13,
                          width: height / 13,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Container(
                              height: height / 26,
                              width: height / 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image:
                                  AssetImage("assets/images/google.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: width / 20),

                    // FACEBOOK
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => print("Facebook login"),
                        child: Container(
                          height: height / 13,
                          width: height / 13,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Container(
                              height: height / 26,
                              width: height / 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/facebook.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height / 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
