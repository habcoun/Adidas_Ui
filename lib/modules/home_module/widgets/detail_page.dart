import 'package:adidas_ui/models/home_model.dart';
import 'package:adidas_ui/themes/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_controller.dart';

class AdidasDetails extends GetView<HomeController> {
  const AdidasDetails({Key? key, required this.adidas}) : super(key: key);

  final Adidas adidas;
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Scaffold(
      body: Stack(
        children: [
          FullSpec(size: size, adidas: adidas),
          buildShadow(size),
          buildAdidasImg(size),
          buildCloseBtn(context),
          GetBuilder<HomeController>(
            init: HomeController(),
            initState: (_) {},
            builder: (homeController) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: KPadding * 1.5,
                  vertical: KPadding * 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: false,
                      child: Image(
                        image: (homeController.themeImageMode)
                            ? AssetImage('assets/adidas-w.png')
                            : AssetImage('assets/adidas-d.png'),
                        width: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        homeController.toogelTheme();
                      },
                      icon: (homeController.themeImageMode)
                          ? Icon(
                              Icons.dark_mode,
                              size: KPadding * 2.5,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.light_mode,
                              size: KPadding * 2.5,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Positioned buildAdidasImg(Size size) {
    return Positioned(
      right: 65,
      top: 0,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (homeController) {
          return Hero(
            tag: adidas.text!,
            child: Transform.rotate(
              angle: 3 * 3.1416 / 2,
              child: Image.asset(
                (homeController.themeImageMode)
                    ? adidas.imgLanscapeD!
                    : adidas.imgLanscape!,
                height: size.width * 1.15,
              ),
            ),
            flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
            ) {
              final Hero toHero = fromHeroContext.widget as Hero;
              final Hero fromHero = fromHeroContext.widget as Hero;

              return RotationTransition(
                turns: flightDirection == HeroFlightDirection.push
                    ? animation.drive(Tween(begin: 0.0, end: -.25))
                    : animation.drive(Tween(begin: .25, end: 0)),
                child: flightDirection == HeroFlightDirection.push
                    ? toHero.child
                    : fromHero.child,
              );
            },
          );
        },
      ),
    );
  }

  Widget buildShadow(Size size) {
    return Hero(
      tag: 'backgroundAdidas',
      child: Container(
        height: size.width - 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [.3, .75, 1.0],
            colors: [
              Colors.orangeAccent,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildCloseBtn(BuildContext context) {
    return Positioned(
      left: KPadding,
      top: KPadding * 2,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.close,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class FullSpec extends StatelessWidget {
  const FullSpec({
    Key? key,
    required this.size,
    required this.adidas,
  }) : super(key: key);

  final Size size;
  final Adidas adidas;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 2.4,
                ),
                GetBuilder<HomeController>(
                  init: HomeController(),
                  initState: (_) {},
                  builder: (homeController) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: KPadding / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            adidas.text!,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'AdidasBold',
                                color: Colors.orangeAccent),
                          ),
                          SizedBox(
                            height: KPadding * 1.5,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.orangeAccent,
                            child: Text(
                              'By ${adidas.text2}'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'AdidasDemiBold',
                                color: (homeController.themeImageMode)
                                    ? Colors.black87
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: KPadding,
                          ),
                          Text(
                            adidas.description.toString(),
                            style: TextStyle(
                              fontFamily: 'Adidas',
                              height: 1.5,
                            ),
                          ),
                          SizedBox(
                            height: KPadding,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.orangeAccent,
                            child: Text(
                              "SPÉCIFICATION",
                              style: TextStyle(
                                fontFamily: 'AdidasDemiBold',
                                color: (homeController.themeImageMode)
                                    ? Colors.black87
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: KPadding,
                          ),
                          Text(
                            adidas.spesification.toString(),
                            style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Adidas',
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
