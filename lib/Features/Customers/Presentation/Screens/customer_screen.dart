import 'package:crystal_navigation_bar/crystal_navigation_bar.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum _SelectedTab { home, wishlist, search, post, profile }

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  _SelectedTab _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _SelectedTab.values.indexOf(_selectedTab),
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('wishlist')),
          Center(child: Text('post')),
          Center(child: Text('Search')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.5),
          borderWidth: 2,
          outlineBorderColor: Colors.white.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: LucideIcons.house,
              unselectedIcon: LucideIcons.house,
              selectedColor: Colors.white,
              badge: Badge(
                label: Text("9+", style: TextStyle(color: Colors.white)),
              ),
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: LucideIcons.heart,
              unselectedIcon: LucideIcons.heart,
              selectedColor: Colors.red,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: LucideIcons.plus,
              unselectedIcon: LucideIcons.plus,
              selectedColor: Colors.white,
            ),

            /// Search
            CrystalNavigationBarItem(
              icon: LucideIcons.search,
              unselectedIcon: LucideIcons.search,
              selectedColor: Colors.white,
            ),

            /// Profile
            CrystalNavigationBarItem(
              icon: LucideIcons.user,
              unselectedIcon: LucideIcons.user,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
