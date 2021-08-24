import 'package:adidas_ui/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final PageController pg = PageController();
  late AnimationController iconController;
  bool isAnimated = false;
  bool themeImageMode = false;
  final List<Adidas> adidasModel = [
    Adidas(
      img: 'assets/boat1.png',
      imgW: 'assets/boat1w.png',
      text: 'IVY PARK',
      text2: 'CHAUSSURE IVY PARK ULTRABOOST OG ',
      imgLanscape: 'assets/boat1landscape.png',
      imgLanscapeD: 'assets/boat1landscaped.png',
      description:
          "Une chaussure à amorti offrant un retour d'énergie infini, avec un clip au talon amovible.",
      spesification:
          "Créée pour marquer les esprits, cette chaussure adidas x IVY PARK Ultraboost réinterprète un célèbre modèle adidas avec confort et style. Son amorti à retour d'énergie assure confort, fluidité et souplesse. Un crochet au talon permet de l'attacher à ton sac à l'aide d'un clip, pour que son look audacieux t'accompagne partout.",
    ),
    Adidas(
      img: 'assets/boat1L1.png',
      imgW: 'assets/boat1D1.png',
      text: 'STAN SMITH PHARRELL WILLIAMS',
      text2:
          'UNE STAN SMITH MINIMALISTE, CRÉÉE EN COLLABORATION AVEC PHARRELL. ',
      imgLanscape: 'assets/boat1landscapeL1.png',
      imgLanscapeD: 'assets/boat1landscapeD1.png',
      description:
          "Une chaussure à amorti offrant un retour d'énergie infini, avec un clip au talon amovible.",
      spesification:
          "Cette chaussure Stan Smith revisite le passé avec audace. Dans sa dernière collaboration avec adidas, Pharrell Williams apporte une énergie nouvelle à des silhouettes adidas iconiques. Lancée sur les courts de tennis dans les années 1970, cette version affiche le style unique du créateur visionnaire avec une conception élégante ponctuée de 3 bandes perforées.",
    ),
    Adidas(
      img: 'assets/boat1.png',
      imgW: 'assets/boat1w.png',
      text: 'IVY PARK',
      text2: 'CHAUSSURE IVY PARK ULTRABOOST OG ',
      imgLanscape: 'assets/boat1landscape.png',
      imgLanscapeD: 'assets/boat1landscaped.png',
      description:
          "Une chaussure à amorti offrant un retour d'énergie infini, avec un clip au talon amovible.",
      spesification:
          "Créée pour marquer les esprits, cette chaussure adidas x IVY PARK Ultraboost réinterprète un célèbre modèle adidas avec confort et style. Son amorti à retour d'énergie assure confort, fluidité et souplesse. Un crochet au talon permet de l'attacher à ton sac à l'aide d'un clip, pour que son look audacieux t'accompagne partout.",
    ),
    Adidas(
      img: 'assets/boat1L1.png',
      imgW: 'assets/boat1D1.png',
      text: 'STAN SMITH PHARRELL WILLIAMS',
      text2:
          'UNE STAN SMITH MINIMALISTE, CRÉÉE EN COLLABORATION AVEC PHARRELL. ',
      imgLanscape: 'assets/boat1landscapeL1.png',
      imgLanscapeD: 'assets/boat1landscapeD1.png',
      description:
          "Une chaussure à amorti offrant un retour d'énergie infini, avec un clip au talon amovible.",
      spesification:
          "Cette chaussure Stan Smith revisite le passé avec audace. Dans sa dernière collaboration avec adidas, Pharrell Williams apporte une énergie nouvelle à des silhouettes adidas iconiques. Lancée sur les courts de tennis dans les années 1970, cette version affiche le style unique du créateur visionnaire avec une conception élégante ponctuée de 3 bandes perforées.",
    ),
  ];

  animateIcon() {
    isAnimated = !isAnimated;
    isAnimated ? iconController.forward() : iconController.reverse();
    update();
  }

  toogelTheme() {
    if (Get.isDarkMode) {
      themeImageMode = false;
      Get.changeThemeMode(ThemeMode.light);
    } else {
      themeImageMode = true;
      Get.changeThemeMode(ThemeMode.dark);
    }
    update();
  }

  double? currentPage = 0.0;

  onPageChange() {
    currentPage = pg.page;
    update();
  }

  @override
  void onInit() {
    pg.addListener(onPageChange);
    super.onInit();
    update();
  }

  @override
  void dispose() {
    pg.removeListener(onPageChange);
    pg.dispose();
    super.dispose();
    update();
  }
}

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme {
    return _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  }

  /// Load isDArkMode from local storage and if it's empty, returns false
  /// (that means default theme is light)

  bool _loadThemeFromBox() {
    return _box.read(_key) ?? false;
  }

  /// Save isDarkMode to local storage

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
