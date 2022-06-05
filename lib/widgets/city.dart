import 'package:flutter/material.dart';
import 'package:flutter_app_home_rent/models/city_model.dart';
import 'package:flutter_app_home_rent/theme.dart';

class CityCard extends StatelessWidget {
  final City city;
  //CityCard(this.city);
  const CityCard({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F9),
        child: Column(
          children: [
            Stack(
              children :[
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.ispopular ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36)
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/icon_star.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                ) : Container(),
              ]
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
