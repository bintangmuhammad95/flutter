import 'package:flutter/material.dart';
import 'package:flutter_app_home_rent/Pages/error_page.dart';
import 'package:flutter_app_home_rent/theme.dart';
import 'package:flutter_app_home_rent/widgets/faciliti_item.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsPages extends StatelessWidget {
  const DetailsPages({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Future<void> launchUrl(String url) async{
      if(await canLaunch(url)){
        await launch(url);
      }else{
        //throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>ErrorPage(),
          ),
        );
      }
    }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Apakah anda sudah yakin'),
                Text('untuk booking tempat ini?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Hubungi'),
              onPressed: () {
                Navigator.of(context).pop();
                launchUrl('tel:+6281385225060');
              },
            ),
          ],
        );
      },
    );
  }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/spaces1.png',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            //tombol back dipindah setelah last view karena tidak jalan
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE : TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Roemah Nenek',
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(
                                    TextSpan(
                                        text: 'Rp. 1.500.000,-',
                                        style: greyTextStyle.copyWith(fontSize: 16),
                                        children: [
                                          TextSpan(
                                              text: '/ month'
                                          )
                                        ]
                                    )
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/icon_star.png',width: 20,),
                                SizedBox(width: 2,),
                                Image.asset('assets/images/icon_star.png',width: 20,),
                                SizedBox(width: 2,),
                                Image.asset('assets/images/icon_star.png',width: 20,),
                                SizedBox(width: 2,),
                                Image.asset('assets/images/icon_star.png',width: 20,color: Color(0xff989BA1),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE : MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilitesItem(
                              name: ' Dapur',
                              imageUrl: 'assets/images/kitchen.png',
                              total: 2,
                            ),
                            FacilitesItem(
                              name: ' Kasur',
                              imageUrl: 'assets/images/bed.png',
                              total: 2,
                            ),
                            FacilitesItem(
                              name: ' Lemari',
                              imageUrl: 'assets/images/cupboard.png',
                              total: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE : PHOTOS
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children : [
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/images/photo1.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/images/photo2.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/images/photo3.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/images/photo4.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              'assets/images/photo5.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE : LOCATION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jl. Palmerah Barat VIII No.32A, RT.4/RW.15,\nPalmerah, Jakarta Barat,Jakarta',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: (){
                                //launchUrl('https://www.purnhub.com/');
                                launchUrl('https://goo.gl/maps/19xksDgHzbxWKSM97');
                              },
                              child: Image.asset(
                                'assets/images/btn_location.png',width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2*edge),
                        child: ElevatedButton(
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: (){
                            showMyDialog();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(purpleColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Image.asset('assets/images/btn_wishlist.png', width: 40,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
