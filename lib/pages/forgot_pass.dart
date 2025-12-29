import 'package:flutter/material.dart';

class forgot_pass extends StatefulWidget {
  const forgot_pass({super.key});

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass> {
  String? email;
  bool isEmailValid = false;

  // Regex for general email validation
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
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.04, top: height * 0.015),
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
              SizedBox(height: height * 0.015),
              Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: width * 0.1, // scales with screen width
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
          padding: EdgeInsets.all(width * 0.04),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                SizedBox(height: height * 0.1),
                Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.03),

                /// EMAIL INPUT
                Center(
                  child: Container(
                    width: width * 0.9,
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
                          vertical: height * 0.02,
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
                ),

                SizedBox(height: height * 0.1),

                /// SEND BUTTON
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: width * 0.25,
                        vertical: height * 0.02,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Send reset password email
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Password reset link sent!")),
                      );
                    }
                  },
                  child: Text(
                    "SEND",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
