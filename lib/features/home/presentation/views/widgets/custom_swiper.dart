import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/utils/utils.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    // final themeState = utils.getTheme;
    // final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    return SizedBox(
      height: size.height * 0.33,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            AppConstants.offerImages[index],
            fit: BoxFit.fill,
          );
        },

        autoplay: true,
        itemCount: AppConstants.offerImages.length,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.white, activeColor: Colors.red)),
        // control: const SwiperControl(color: Colors.black),
      ),
    );
  }
}
