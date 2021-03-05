import 'package:meta/meta.dart';

class NationModel {
  final String nationName;
  final String imagePath;
  final String countryId;

  NationModel(
      {@required this.nationName,
      @required this.imagePath,
      @required this.countryId});
}

List<NationModel> nations = [
  NationModel(
      nationName: "Argentina",
      imagePath: "assets/images/flags/argentina.png",
      countryId: "52"),
  NationModel(
      nationName: "Brazil",
      imagePath: "assets/images/flags/brazil.png",
      countryId: "54"),
  NationModel(
      nationName: "Germany",
      imagePath: "assets/images/flags/germany.png",
      countryId: "21"),
  NationModel(
      nationName: "England",
      imagePath: "assets/images/flags/england.png",
      countryId: "14"),
  NationModel(
      nationName: "France",
      imagePath: "assets/images/flags/france.png",
      countryId: "18"),
  NationModel(
      nationName: "Italy",
      imagePath: "assets/images/flags/italy.png",
      countryId: "27"),
  NationModel(
      nationName: "Spain",
      imagePath: "assets/images/flags/spain.png",
      countryId: "45"),
];
