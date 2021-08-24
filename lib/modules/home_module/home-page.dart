import 'package:adidas_ui/models/home_model.dart';
import 'package:adidas_ui/themes/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'widgets/detail_page.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (homeController) {
        return Scaffold(
          body: Stack(
            children: [
              Hero(
                tag: "backgroundAdidas",
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.5,
                        1,
                      ],
                      colors: [
                        Colors.orangeAccent,
                        Colors.orangeAccent.withOpacity(0.1),
                        Colors.grey.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
              ),
              PageView.builder(
                controller: homeController.pg,
                itemCount: homeController.adidasModel.length,
                itemBuilder: (context, index) {
                  final adidas = homeController.adidasModel[index];
                  final value = index < homeController.currentPage!
                      ? homeController.currentPage! - index
                      : index - homeController.currentPage!;
                  final num opacity =
                      (1 - (value == 1.0 ? 1.0 : value * 2)).clamp(0.0, 1.0);
                  return Transform.scale(
                    scale: opacity.clamp(0.85, 1.0) as double,
                    child: Opacity(
                      opacity: opacity as double,
                      child: AdidasCard(
                        adidas: adidas,
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: KPadding * 1.5,
                  vertical: KPadding * 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: (homeController.themeImageMode)
                          ? AssetImage('assets/adidas-d.png')
                          : AssetImage('assets/adidas-w.png'),
                      width: 50,
                    ),
                    IconButton(
                      onPressed: () {
                        homeController.toogelTheme();
                      },
                      icon: (homeController.themeImageMode)
                          ? Icon(
                              Icons.dark_mode,
                              size: KPadding * 2,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.light_mode,
                              size: KPadding * 2,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AdidasCard extends StatelessWidget {
  const AdidasCard({
    Key? key,
    required this.adidas,
  }) : super(key: key);

  final Adidas adidas;
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (homeController) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: adidas.text!,
              child: Image.asset(
                (homeController.themeImageMode) ? adidas.imgW! : adidas.img!,
                height: size.height * .5,
              ),
            ),
            SizedBox(
              height: KPadding * 2.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KPadding),
              child: Text(
                adidas.text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'AdidasBold',
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            SizedBox(
              height: KPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: KPadding * 2.5,
              ),
              child: Text(
                'By ${adidas.text2}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  fontFamily: 'AdidasDemiBold',
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: KPadding,
            ),
            Padding(
              padding: const EdgeInsets.all(KPadding * 1),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return AdidasDetails(
                          adidas: adidas,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  color: (homeController.themeImageMode)
                      ? Colors.white
                      : Colors.orangeAccent,
                  child: Text(
                    "spécification".toUpperCase(),
                    style: TextStyle(
                        color: (homeController.themeImageMode)
                            ? Colors.black87
                            : Colors.white,
                        fontFamily: 'AdidasDemiBold'),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
