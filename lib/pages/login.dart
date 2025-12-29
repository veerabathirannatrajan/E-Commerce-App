import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController emailController = TextEditingController();
  bool _obscurePassword = true;

  String? password;
  String? email;
  bool isEmailValid = false;

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
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: height / 7,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.04, top: height * 0.01),
          child: Column(
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
              SizedBox(height: height * 0.01),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: width * 0.12,
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              children: [
                SizedBox(height: height / 15),

                // EMAIL FIELD
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
                        horizontal: width * 0.05,
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
                        return 'Enter a valid Gmail address';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: height / 50),

                // PASSWORD FIELD
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
                        horizontal: width * 0.05,
                        vertical: height * 0.018,
                      ),
                    ),
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&+*~]).{8,}$',
                      ).hasMatch(value)) {
                        return 'Password must contain A-Z, a-z, 0-9 & special char';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: height / 60),

                // FORGOT PASSWORD
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot_pass');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password ?",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.037,
                        ),
                      ),
                      SizedBox(width: width / 50),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot_pass');
                        },
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.red, size: width * 0.06),
                      ),
                      SizedBox(width: width / 50),
                    ],
                  ),
                ),

                SizedBox(height: height / 25),

                // SIGN IN BUTTON
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/main');
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,

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
                    // GOOGLE BUTTON
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
                                  image: AssetImage("assets/images/google.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: width / 20),

                    // FACEBOOK BUTTON
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
                                  image:
                                  AssetImage("assets/images/facebook.png"),
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
