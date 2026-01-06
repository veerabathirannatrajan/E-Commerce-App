import 'package:flutter/material.dart';

class check extends StatefulWidget {
  const check({super.key});

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/Pullover.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text(
                    'New collection',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),)
              ],
            ),
          ),
          Expanded(
            flex: 11,
            child: Flex(direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 2,
                  child: Flex(direction: Axis.vertical,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white


                              ),
                            ),
                            Center(
                              child: Positioned(
                                child: Text(
                                  'Summer\nsale',
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2,
                                    color: Colors.red,
                                  ),
                                ),),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/black.png'),
                                  fit: BoxFit.cover,
                                ),

                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              left: 20,
                              child: Text(
                                'black',
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 2,
                                  color: Colors.white,
                                ),
                              ),)
                          ],
                        ),
                      ),

                    ],),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/hoodies.png'),
                            fit: BoxFit.cover,
                          ),

                        ),
                      ),
                      Center(
                        child: Positioned(

                          child: Text(
                            'Men\'s\nhoodies',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }
}
