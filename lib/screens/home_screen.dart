import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/index_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Pantalla Home", style: TextStyle(fontSize: 24))),
    const Center(
      child: Text("Pantalla Favoritos", style: TextStyle(fontSize: 24)),
    ),
    const Center(child: IndexScreen()),
    const Center(
      child: Text("Pantalla Búsqueda", style: TextStyle(fontSize: 24)),
    ),
    const Center(
      child: Text("Pantalla Perfil", style: TextStyle(fontSize: 24)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _pages[_selectedIndex],
      floatingActionButton: SizedBox(
        width: 76,
        height: 76,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => _onItemTapped(2),
          elevation: 6,
          child: Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF64B5F6), Color(0xFF1976D2)],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_cart,
              size: 34,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.black,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_rounded, "Home", 0),
              _buildNavItem(Icons.star_rounded, "Favoritos", 1),
              const SizedBox(width: 48), // Espacio para el FAB
              _buildNavItem(Icons.search_rounded, "Buscar", 3),
              _buildNavItem(Icons.person_rounded, "Perfil", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white,
              size: 32,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
