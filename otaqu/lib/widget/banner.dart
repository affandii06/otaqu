import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:otaqu/model/dummy_model.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlayCurve: Curves.easeIn,
          height: MediaQuery.of(context).size.height,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
          },
        ),
        itemCount: DummyModel.banner.length,
        itemBuilder: (context, index, realIdx) {
          return Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(DummyModel.banner[index]),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              )
            ),
          );
        }
      ),
    );
  }
}