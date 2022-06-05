import 'package:flutter/material.dart';

import '../theme.dart';

class FacilitesItem extends StatelessWidget {

  final String name;
  final String imageUrl;
  final int total;

  const FacilitesItem({Key? key, required this.name, required this.imageUrl, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: name,
                style: greyTextStyle.copyWith(fontSize: 14),
              )
            ]
          )
        ),
      ],
    );
  }
}
