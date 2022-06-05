import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_home_rent/models/coba_coba_model.dart';
import 'package:flutter_app_home_rent/models/space_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class SpaceProvider extends ChangeNotifier{

  List<Space> _allSpace = [];

  List<Space> get allSpace => _allSpace;

  //int get jumlahPlayer => _allPlayer.length;

  Future<List<Space>> initialData() async {
    Uri url = Uri.parse(
        "https://http-request-cozy-default-rtdb.asia-southeast1.firebasedatabase.app/Space.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach(
          (key, item) {
            print("key");
            print(key);
            print(key.runtimeType);
            print("value");
            print(item);
            print(item.runtimeType);
       // DateTime dateTimeParse = DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        _allSpace.add(
            Space(
              id: item['id'],
              name: item['name'] ,
              imageUrl : item['image_url'],
              price: item['price'],
              city: item['city'] ,
              country: item['country'] ,
              rating: item['rating'],
              address: item['address'] ,
              phone: item['phone'] ,
              mapurl: item['map_url'] ,
              photos : item['photos'],
              numberofkitchen: item['number_of_kitchens'] ,
              numberofbedrooms: item['number_of_bedrooms'] ,
              numberofcupboards: item['number_of_cupboards'] ,
            )
        );
      },
    );
    print("cek Instance of Space");
    print(allSpace);
    print("MASUK YA ALLAH MASA GA MASUK");

    notifyListeners();
    return _allSpace;
  }
}
