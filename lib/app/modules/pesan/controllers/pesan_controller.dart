import 'package:get/get.dart';

class PesanController extends GetxController {
  List<MessageModel> messages = [
    MessageModel(
      name: "Maciej Kowalski",
      subtitle: "maciej.kowalski@email.com",
      time: "08:43",
      image: "assets/maciej.jpg",
    ),
    MessageModel(
      name: "Odeusz Piotrowski",
      subtitle: "Will do, super, thank you 😊❤️",
      time: "Tue",
      image: "assets/odeusz.jpg",
    ),
    MessageModel(
      name: "Bożenka Malina",
      subtitle: "Uploaded file.",
      time: "Sun",
      image: "assets/bozenka.jpg",
    ),
    MessageModel(
      name: "Maciej Orłowski",
      subtitle: "Here is another tutorial, if you...",
      time: "23 Mar",
      image: "assets/maciej2.jpg",
    ),
    MessageModel(
      name: "Krysia Eurydyka",
      subtitle: "😅",
      time: "18 Mar",
      image: "assets/krysia.jpg",
    ),
    MessageModel(
      name: "MC Bastek",
      subtitle: "no pracujemy z domu przez 5 ...",
      time: "01 Feb",
      image: "assets/bastek.jpg",
    ),
    MessageModel(
      name: "Marzena Klasa",
      subtitle: "potem sie zobaczy",
      time: "01 Feb",
      image: "assets/marzena.jpg",
    ),
  ];
}

class MessageModel {
  final String name;
  final String subtitle;
  final String time;
  final String image;

  MessageModel({
    required this.name,
    required this.subtitle,
    required this.time,
    required this.image,
  });
}
