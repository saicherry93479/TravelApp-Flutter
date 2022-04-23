// 897.170731707317 -height of my screen
// 421.4634146341463 -width of my screen

import 'package:flutter/material.dart';

double getScreenHeight(context, double value) {
  return (MediaQuery.of(context).size.height * value) / 897.170731707317;
}

double getScreenWidth(context, double value) {
  return (MediaQuery.of(context).size.width * value) / 421.4634146341463;
}

Color mainColor = Color(0XFF448FFF);

class Allitems {
  String Image;
  String Name;
  Allitems({required this.Image, required this.Name});
}

List ItemsList = [
  Allitems(Image: 'assets/images/flight.svg', Name: 'Flight'),
  Allitems(Image: 'assets/images/Build.svg', Name: 'Hotel'),
  Allitems(Image: 'assets/images/train.svg', Name: 'Train'),
  Allitems(Image: 'assets/images/car.svg', Name: 'Car')
];

class BookItems {
  String Name;
  int current;
  BookItems({required this.Name, required this.current});
}

List BookList = [
  BookItems(Name: 'Trending', current: 0),
  BookItems(Name: 'Featured', current: 1),
  BookItems(Name: 'Top Visited', current: 2)
];

class ScrollItem {
  String image;
  String rating;
  String name;
  String place;
  String price;
  List<String> Gallery = [
    'assets/images/Gallery.png',
    'assets/images/GalleryOne.png',
    'assets/images/GalleryTwo.png'
  ];
  String desc;
  int days;
  ScrollItem(
      {required this.image,
      required this.name,
      required this.place,
      required this.days,
      required this.price,
      required this.rating,
      required this.desc});
}

List Trending = [
  ScrollItem(
      image: 'assets/images/CairoImage.png',
      name: 'Hilton Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      days: 3,
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... "),
  ScrollItem(
      image: 'assets/images/ParadiseHotel.png',
      name: 'Hilton2 Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
  ScrollItem(
      image: 'assets/images/CairoImage.png',
      name: 'Hilton3 Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
];
List TopVisited = [
  ScrollItem(
      image: 'assets/images/ParadiseHotel.png',
      name: 'TopVisited Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
  ScrollItem(
      image: 'assets/images/ParadiseHotel.png',
      name: 'Hilton Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
  ScrollItem(
      image: 'assets/images/CairoImage.png',
      name: 'Hilton Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
];

List Featured = [
  ScrollItem(
      image: 'assets/images/CairoImage.png',
      name: 'Featured Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
  ScrollItem(
      image: 'assets/images/ParadiseHotel.png',
      name: 'Hilton Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
  ScrollItem(
      image: 'assets/images/CairoImage.png',
      name: 'Hilton Resort',
      place: 'Cairo,Egypy',
      price: '\$453',
      rating: '4.9',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
];

class BottomItem {
  String image;
  int index;
  String imageTwo;
  BottomItem(
      {required this.image, required this.index, required this.imageTwo});
}

List BottomItems = [
  BottomItem(
      image: 'assets/images/Home.svg',
      index: 0,
      imageTwo: 'assets/images/HomeActive.svg'),
  BottomItem(
      image: 'assets/images/Heart.svg',
      index: 1,
      imageTwo: 'assets/images/HeartActive.svg'),
  BottomItem(
      image: 'assets/images/Bell.svg',
      index: 2,
      imageTwo: 'assets/images/BellActive.svg'),
  BottomItem(
      image: 'assets/images/People.svg',
      index: 3,
      imageTwo: 'assets/images/PeopleActive.svg')
];

List recommendedHotels = [
  ScrollItem(
      image: 'assets/images/HotelOne.jpg',
      name: 'Hilton One',
      place: 'Cairo,Egypy',
      price: '\$153',
      rating: '3.6',
      days: 2,
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... "),
  ScrollItem(
      image: 'assets/images/HotelTwo.jpg',
      name: 'Hotel Two',
      place: 'Cairo,Egypy',
      price: '\$513',
      rating: '4.3',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 5),
  ScrollItem(
      image: 'assets/images/HotelThree.jpg',
      name: 'Hotel Three',
      place: 'Cairo,Egypy',
      price: '\$248',
      rating: '4.2',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 1),
  ScrollItem(
      image: 'assets/images/HotelFour.jpg',
      name: 'Hotel Four',
      place: 'Cairo,Egypy',
      price: '\$148',
      rating: '4.2',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 2),
  ScrollItem(
      image: 'assets/images/HotelThree.jpg',
      name: 'Hotel Five',
      place: 'Cairo,Egypy',
      price: '\$786',
      rating: '4.2',
      desc:
          "Hotel located on the east bank of the Nile River in the historical quarter of Garden City... ",
      days: 10),
];
