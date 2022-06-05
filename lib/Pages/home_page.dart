import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_home_rent/models/city_model.dart';
import 'package:flutter_app_home_rent/models/space_model.dart';
import 'package:flutter_app_home_rent/models/tips_model.dart';
import 'package:flutter_app_home_rent/provider/space_provider.dart';
import 'package:flutter_app_home_rent/theme.dart';
import 'package:flutter_app_home_rent/widgets/bottom_navibar_item.dart';
import 'package:flutter_app_home_rent/widgets/city.dart';
import 'package:flutter_app_home_rent/widgets/spaces_card.dart';
import 'package:flutter_app_home_rent/widgets/tips_card.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final spaceProvider = Provider.of<SpaceProvider>(context, listen: false);
    //for access Data use Profider.of
    //var spaceProvider = Provider.of<SpaceProvider>(context);
    //spaceProvider.getRecommendedSpaces();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          //NOTE : TITLE/HEADER
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/jakarta.png',
                      ispopular: false,
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/bandung.png',
                      ispopular: true,
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/surabaya.png',
                      ispopular: false,
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                      city: City(
                        id: 4,
                        name: 'Palembang',
                        imageUrl: 'assets/images/palembang.png',
                        ispopular: false,
                      )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                      city: City(
                        id: 5,
                        name: 'Aceh',
                        imageUrl: 'assets/images/aceh.png',
                        ispopular: true,
                      )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                      city: City(
                        id: 6,
                        name: 'Bogor',
                        imageUrl: 'assets/images/bogor.png',
                        ispopular: false,
                      )
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            //NOTE : RECOMENDED CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge
              ),
              child: /*ElevatedButton(
                child: Text(
                  'Debug Spaces',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                onPressed: (){
                  spaceProvider.initialData();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(purpleColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),*/
              //Untuk menentukan status Future pada saat itu dan memilih apa yang ditampilkan saat data dimuat hingga data sudah tersedia
             FutureBuilder(
                future: spaceProvider.initialData(),
                builder: (context, snapshot){
                  print(snapshot.hasData);
                  if(snapshot.hasData){
                    List <Space> data = snapshot.data as List<Space>;
                    int index = 0;
                    return Column(
                      children: data.map((item){
                        index++;
                        print("Display Space - ");
                        print(index);
                        return Container(
                          child: SpaceCard(space: item),
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 3,
                          ),
                        );
                      }).toList(),
                      /*[
                        SpaceCard(
                          space: Space(
                            id: 1,
                            name: 'Roemah Nenek',
                            imageUrl: 'assets/images/spaces1.png',
                            price: '1.500.000,-',
                            city: 'Jakarta',
                            country: 'Indonesia',
                            rating: 4,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SpaceCard(
                          space: Space(
                            id: 2,
                            name: 'Kost Mawar',
                            imageUrl: 'assets/images/spaces2.png',
                            price: '2.500.000,-',
                            city: 'Jakarta',
                            country: 'Indonesia',
                            rating: 5,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SpaceCard(
                          space: Space(
                            id: 3,
                            name: 'City of Lusa',
                            imageUrl: 'assets/images/spaces3.png',
                            price: '1.300.000,-',
                            city: 'Surabaya',
                            country: 'Indonesia',
                            rating: 4,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SpaceCard(
                          space: Space(
                            id: 1,
                            name: 'Rumah Tetangga',
                            imageUrl: 'assets/images/spaces4.png',
                            price: '1.000.000,-',
                            city: 'Bandung',
                            country: 'Indonesia',
                            rating: 4,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SpaceCard(
                          space: Space(
                            id: 1,
                            name: 'Kos Puncak',
                            imageUrl: 'assets/images/spaces5.png',
                            price: '1.000.000,-',
                            city: 'Bogor',
                            country: 'Indonesia',
                            rating: 5,
                          ),
                        ),
                      ],*/
                    );
                  }
                  else {
                    print('KAMPREETTT');
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE : GUIDANCE & TIPS
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    tips: Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/images/cityguide.png',
                      updatedAt:'Updated 20 Jun',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    tips: Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/images/jftips.png',
                      updatedAt:'21 Jun',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),

          ],
        ),
      ),
      //agar bottom bar navigation tetap di bawah
      floatingActionButton: Container(
        height: 65,
        //lebar layar - 2 kali margin kanan kiri
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/images/icon_email.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
