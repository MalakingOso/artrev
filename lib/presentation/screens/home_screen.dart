import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:artrev/core/constants/app_colors.dart';
import 'package:artrev/presentation/screens/search_screen.dart';
import 'package:artrev/presentation/screens/saved_articles_screen.dart';
import 'package:artrev/presentation/screens/flashcards_screen.dart';
import 'package:artrev/presentation/widgets/custom_title_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const SearchScreen(),
    const SavedArticlesScreen(),
    const FlashcardsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Remove the default AppBar
      // Instead, wrap the body in a Column with our custom title bar
      body: Column(
        children: [
          // Custom title bar
          CustomTitleBar(
            title: 'ArtRev',
            onMenuPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          
          // Main content
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ArtRev',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your urogynecology literature companion',
                    style: TextStyle(
                      color: Colors.white.withAlpha(25),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search, color: AppColors.primary),
              title: const Text('Search Literature'),
              selected: _selectedIndex == 0,
              selectedTileColor: AppColors.primaryLight.withAlpha(25),
              selectedColor: AppColors.primary,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark, color: AppColors.primary),
              title: const Text('Saved Articles'),
              selected: _selectedIndex == 1,
              selectedTileColor: AppColors.primaryLight.withAlpha(25),
              selectedColor: AppColors.primary,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.flash_on, color: AppColors.primary),
              title: const Text('Flashcards'),
              selected: _selectedIndex == 2,
              selectedTileColor: AppColors.primaryLight.withAlpha(25),
              selectedColor: AppColors.primary,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.secondary),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: AppColors.secondary),
              title: const Text('About'),
              onTap: () {
                // Show about dialog
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        backgroundColor: AppColors.surface,
        elevation: 3,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          NavigationDestination(
            icon: Icon(Icons.flash_on),
            label: 'Flashcards',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}