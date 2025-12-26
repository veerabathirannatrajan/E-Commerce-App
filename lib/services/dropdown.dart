import 'package:flutter/material.dart';

class dropdown extends StatelessWidget {
  const dropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child:DropdownButton(
            items:  const [
              DropdownMenuItem(value: 'home', child: Text('Home')),
              DropdownMenuItem(value: 'shop', child: Text('Shop')),
              DropdownMenuItem(value: 'bag', child: Text('Bag')),
              DropdownMenuItem(value: 'favorite', child: Text('Favorite')),
              DropdownMenuItem(value: 'profile', child: Text('Profile')),
            ],
            onChanged: (value){}
        )
    );
  }
}
