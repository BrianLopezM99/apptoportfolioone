import 'package:flutter/material.dart';

class SneakerCard extends StatelessWidget {
  const SneakerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: 300,
      height: 280,
      margin: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Card principal
          Positioned(
            top: 20,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFE3F2FD),
                    Color(0xFFBBDEFB),
                    Color(0xFF90CAF9),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header con iconos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ],
                    ),

                    // Spacer para empujar el contenido hacia abajo
                    const Spacer(),

                    // Información del producto
                    const Text(
                      'Nike Air Zoom Trainers',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      '\$120',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Imagen del tenis sobresaliendo
          Positioned(
            top: -25,
            right: -screenHeight * 0.05,
            child: SizedBox(
              width: 240,
              height: 240,
              child: Image.asset('assets/logo.png', fit: BoxFit.contain),
            ),
          ),
          Positioned(
            bottom: 0,
            right: screenHeight * 0.002,
            child: SizedBox(
              width: 40,
              height: 60,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
