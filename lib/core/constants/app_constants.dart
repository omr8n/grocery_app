import 'package:flutter/material.dart';

import '../utils/app_images.dart';

class AppConstants {
  static const String productImageUrl =
      "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg";

  static List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  static List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': Assets.imagesCatFruits,
      'catText': 'Fruits',
    },
    {
      'imgPath': Assets.imagesCatVeg,
      'catText': 'Vegetables',
    },
    {
      'imgPath': Assets.imagesCatSpinach,
      'catText': 'Herbs',
    },
    {
      'imgPath': Assets.imagesCatNuts,
      'catText': 'Nuts',
    },
    {
      'imgPath': Assets.imagesCatSpices,
      'catText': 'Spices',
    },
    {
      'imgPath': Assets.imagesCatGrains,
      'catText': 'Grains',
    },
  ];

  static final List<String> offerImages = [
    'assets/images/offres/Offer1.jpg',
    'assets/images/offres/Offer2.jpg',
    'assets/images/offres/Offer3.jpg',
    'assets/images/offres/Offer4.jpg'
  ];
  static List<String> authImagesPaths = [
    'assets/images/landing/buy-on-laptop.jpg',
    'assets/images/landing/buy-through.png',
    'assets/images/landing/buyfood.jpg',
    'assets/images/landing/grocery-cart.jpg',
    'assets/images/landing/grocery-cart.jpg',
    'assets/images/landing/store.jpg',
    'assets/images/landing/vergtablebg.jpg',
  ];
}
