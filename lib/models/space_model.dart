class Space{
   int id;
   String name;
   String imageUrl;
   String city;
   String country;
   String price;
   int rating;
   String address;
   String phone;
   String mapurl;
   List photos;
   int numberofkitchen;
   int numberofbedrooms;
   int numberofcupboards;

  Space({required this.id,
    required this.name,
   required this.imageUrl,
    required this.city,
    required this.country,
    required this.price,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapurl,
    required this.photos,
    required this.numberofkitchen,
    required this.numberofbedrooms,
    required this.numberofcupboards,
  });

  /* Space.formJson(Map<String,dynamic> item)
        :id = item['id'],
         name = item['name'] ,
         //   imageUrl : json['image_Url']as String,
         city = item['city'] ,
         country = item['country'] ,
         price = item['price'],
         rating = item['rating'],
         address = item['address'] ,
         phone= item['phone'] ,
         mapurl= item['map_url'] ,
         //  photos : json['photos'] as List,
         numberofkitchen= item['number_of_kitchens'] ,
         numberofbedrooms= item['number_of_bedrooms'] ,
         numberofcupboards =item['number_of_cupboards'] ;
*/


   /*factory Space.formJson(Map<String,dynamic> json) {
     print(json['city']);
     return Space(
       id: json['id'] ,
       name: json['name'] ,
       imageUrl : json['image_Url'],
       price: json['price'] ,
       city: json['city'] ,
       country: json['country'] ,
       rating: json['rating'] ,
       address: json['address'] ,
       phone: json['phone'] ,
       mapurl: json['map_url'] ,
       photos : json['photos'] ,
       numberofkitchen: json['number_of_kitchens'] ,
       numberofbedrooms: json['number_of_bedrooms'] ,
       numberofcupboards: json['number_of_cupboards'] ,
     );
   }*/

}