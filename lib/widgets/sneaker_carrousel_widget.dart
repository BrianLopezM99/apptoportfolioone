import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/sneaker_card_widget.dart';

class SneakerCarousel extends StatelessWidget {
  const SneakerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 356, // Altura suficiente
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.75, // Muestra parte de las cards adyacentes
        ),
        itemCount: 4, // 4 cards como querías
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SneakerCard(), // Tu card sin modificar
          );
        },
      ),
    );
  }
}
