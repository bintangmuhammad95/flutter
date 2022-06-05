import 'package:flutter/material.dart';
import 'package:flutter_app_home_rent/Pages/details_page.dart';
import 'package:flutter_app_home_rent/models/space_model.dart';
import 'package:flutter_app_home_rent/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  const SpaceCard({Key? key,required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPages(),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  //Image.asset(space.imageUrl),
                 Image.network(
                    space.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36)
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Image.asset(
                              'assets/images/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ]
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Text.rich(
                TextSpan(
                  text: 'Rp. ${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: '/ month'
                    )
                  ]
                )
              ),
              SizedBox(
                height: 16,
              ),
              Text('${space.city}, ${space.country}', style: greyTextStyle,)
            ],
          ),
        ],
      ),
    );
  }
}
