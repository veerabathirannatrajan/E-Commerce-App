import 'package:flutter/material.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {



  String password ='';
  String name ='';
  String email ='';


  final TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  // email validate function

  bool checkEmail(String value) {
    return value.trim().endsWith("@gmail.com");
  }

  bool validate (){
    return  (password.isNotEmpty && name.isNotEmpty && email.isNotEmpty);
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
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign up',
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Center(
              child: Container(
                width: 1200,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],

                ) ,



                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 22, // 👈 input text size
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration:InputDecoration(
                      hint: Text("Name",
                        style:TextStyle(
                            color: Colors.grey[400],
                            fontSize: 20
                        ),
                      ),
                      focusColor: Colors.redAccent,
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 35
                      ),

                      fillColor: Colors.white
                  ),
                  onChanged: (value){
                    setState(() {
                      name=value;
                    });
                  },

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
            ),

            SizedBox(height: 20,),

            Center(
              child: Container(
                height: 80,
                width: 1200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],

                ) ,


                child: TextFormField(

                  decoration:InputDecoration(
                      suffixIcon: Icon(
                        isEmailValid ? Icons.check_outlined : Icons.close,
                        color: isEmailValid ? Colors.green : Colors.red,
                        size: 30,
                      ),
                      hint: Text("Email",
                        style:TextStyle(
                            color: Colors.grey[400],
                            fontSize: 20
                        ),
                      ),

                      prefixIcon: Icon(Icons.mail_outlined),

                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 35
                      ),
                      border: InputBorder.none,

                      fillColor: Colors.white
                  ),
                  onChanged: (value){
                    setState(() {
                      isEmailValid = checkEmail(value);
                    });
                  },

                  validator: (value) {
                    if (value==null||value.isEmpty){
                      return"email cannot be null";
                    }
                    if (!value.endsWith("@gmail.com")) {
                      return "Email must end with @gmail.com";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),

            Center(
              child: Container(
                width: 1200,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],

                ) ,



                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration:InputDecoration(
                      hint: Text("Password",
                        style:TextStyle(
                            color: Colors.grey[400],
                            fontSize: 20
                        ),
                      ),
                      focusColor: Colors.redAccent,
                      prefixIcon: Icon(Icons.password_sharp),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 35
                      ),

                      fillColor: Colors.white
                  ),
                  onChanged: (value){
                    setState(() {
                      password=value;
                    });
                  },

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
              ),
            ),

            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15

                  ),),
                SizedBox(width: 10,),

                IconButton(onPressed: (){
                  Navigator.pushNamed(context, '/login');
                },
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.red,)

              ],
            ),

            SizedBox(
              height: 30,
            ),

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
                Navigator.pushReplacementNamed(context, '/main');

              },
              child: Text("SIGN UP",

                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.white),


              ),),

            SizedBox(
              height: 100,
            ),

            Text("Or login with social account" ,
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                color: Colors.black,

              ),
            ),

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      print("google button clicked");
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),),
                      child: Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image:const  DecorationImage(image: AssetImage("assets/images/google.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),


                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 20,),


                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      print("Facebook button clicked");
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),),
                      child: Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image:const  DecorationImage(image: AssetImage("assets/images/facebook.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),


                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),



          ],
        ),
      ),
    );
  }
}
