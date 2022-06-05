import 'package:flutter/material.dart';
import 'package:flutter_app_home_rent/Pages/home_page.dart';
import 'package:flutter_app_home_rent/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/bottom.png')),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Fine Cozy House\nto Stay and Happy',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: 210,
                    child: ElevatedButton(
                      child: Text(
                        'Explore Now',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(purpleColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
