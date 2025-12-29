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
    // Get screen dimensions
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: height * 0.012,
              horizontal: width * 0.02
          ),
          height: height * 0.2, // responsive height
          width: width, // full width
          padding: EdgeInsets.all(width * 0.02), // responsive padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // LEFT TEXT SECTION
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(12),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: width * 0.06, // responsive font size
                      letterSpacing: 2,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              // RIGHT IMAGE SECTION
              Expanded(
                flex: 6,
                child: Container(
                  height: height * 0.18, // responsive image height
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/$image'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
