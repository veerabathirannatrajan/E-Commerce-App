import 'package:e_com/pages/categories.dart';
import 'package:flutter/material.dart';

class catCard extends StatelessWidget {
  final String name;
  final String image;


  const catCard({
    super.key,
    required this.name,
    required this.image,
  });




  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),

        // 👇🏼👇🏼👇🏼👇🏼 on tap
        onTap: () {


        },
        child: Center(

          child: Container(
            height: 170,
            width: 470,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 170,
                  width: 235,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12)
                    )
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(name,
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                ),

                Container(
                  alignment: Alignment.centerLeft,
                  height: 170,
                  width: 219,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/$image'),
                    fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(12)
                      )
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
