import 'package:flutter/material.dart';
import 'package:flutter_app_home_rent/theme.dart';

class BottomNavBarItem extends StatelessWidget {

  final String imageUrl;
  final bool isActive;

  const BottomNavBarItem({Key? key, required this.imageUrl, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive ? Container(
          height: 2,
          width: 30,
          decoration: BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(1000),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}
