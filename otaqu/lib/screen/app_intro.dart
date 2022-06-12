import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:otaqu/provider/app_intro_provider.dart';
import 'package:otaqu/screen/home.dart';
import 'package:otaqu/shared-preference/sharedpreference.dart';
import 'package:otaqu/support-component/button.dart';
import 'package:otaqu/util.dart';
import 'package:provider/provider.dart';

class AppIntro extends StatefulWidget {
  static const id = "app_intro";
  const AppIntro({Key? key}) : super(key: key);

  @override
  State<AppIntro> createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppIntroProvider>(
      builder: (context, appIntro, _) {
        return Scaffold(
          body: Stack(
            children: [
              CarouselSlider.builder(
                carouselController: carouselController,
                  options: CarouselOptions(
                  autoPlayCurve: Curves.easeIn,
                  height: MediaQuery.of(context).size.height,
                  aspectRatio: 1,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    appIntro.setIndex(index);
                  },
                ),
                itemCount: appIntro.appIntro.length,
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(appIntro.appIntro[index]['image']),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,top: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(appIntro.appIntro[index]['title'],
                              style: OtaquText.customText(
                                size: 32,
                                weight: FontWeight.w900,
                                color: Colors.white,
                                shadow: const <Shadow>[
                                  Shadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25,),
                            Text(appIntro.appIntro[index]['subtitle'],
                              style: OtaquText.customText(
                                size: 24,
                                weight: FontWeight.w700,
                                color: Colors.white,
                                shadow: const <Shadow>[
                                  Shadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60, right: 20, left: 20),
                  child: appIntro.index == 0 ? 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OtaquButton(
                          height: 40,
                          color: Colors.white,
                          radius: 10,
                          title: 'Next',
                          textStyle: OtaquText.customText(
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.w700
                          ),
                          action: (){
                            carouselController.nextPage();
                            appIntro.setIndex(1);
                          },
                        ),
                      ),
                      const SizedBox(width: 40,),
                      Expanded(
                        child: OtaquButton(
                          height: 40,
                          radius: 10,
                          color: Colors.white,
                          title: 'Skip',
                          textStyle: OtaquText.customText(
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.w700
                          ),
                          action: (){
                            LocalData.prefSaveBool(
                              key: 'appIntro',
                              value: true
                            );
                            Navigator.pushNamedAndRemoveUntil(context, Home.id, (route) => false);
                          },
                        ),
                      )
                    ],
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OtaquButton(
                          height: 40,
                          color: Colors.white,
                          radius: 10,
                          title: 'Get Started',
                          textStyle: OtaquText.customText(
                            size: 18,
                            color: Colors.black,
                            weight: FontWeight.w700
                          ),
                          action: (){
                            LocalData.prefSaveBool(
                              key: 'appIntro',
                              value: true
                            );
                            Navigator.pushNamedAndRemoveUntil(context, Home.id, (route) => false);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < appIntro.appIntro.length;
                          i++)
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: i == appIntro.index
                                  ? OtaquColor.blue
                                  : OtaquColor.softGrey2),
                        ),
                    ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}