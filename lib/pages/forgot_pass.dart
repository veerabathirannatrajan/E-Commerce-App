import 'package:flutter/material.dart';

class forgot_pass extends StatefulWidget {
  const forgot_pass({super.key});

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass> {

  String email_id = '' ;
  String password = '' ;

  final TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  // email validate function

  bool checkEmail(String value) {
    return value.trim().endsWith("@gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
              const Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'Please, enter your email address. You will receive a link to create a new password via email.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 20,),
      Center(
        child: SizedBox(
          height: 80,
          width: 1200,
          child: TextFormField(
            style: const TextStyle(
              fontSize: 22,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 20,
              ),

              prefixIcon: const Icon(Icons.mail_outlined),

              suffixIcon: Icon(
                isEmailValid ? Icons.check_outlined : Icons.close,
                color: isEmailValid ? Colors.green : Colors.red,
                size: 30,
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 35,
              ),

              // 🟢 Normal border
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),

            onChanged: (value) {
              setState(() {
                isEmailValid = checkEmail(value);
              });
            },

            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email cannot be empty";
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return "Not a valid email address.\nShould be your@email.com";
              }
              return null;
            },
          ),
        ),
      ),

          SizedBox(height: 50,),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red),
              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                  horizontal: 200,
                  vertical: 25
              )
              ),


            ),

            onPressed: (){


            },
            child: Text("SEND",

              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 20,
                  color: Colors.white),


            ),
          ),


      ],
      ),

    );
  }
}
