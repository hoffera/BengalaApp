import 'package:bengalapp/view/homescreen.dart';
import 'package:bengalapp/view/route_page.dart';
import 'package:bengalapp/view/settings_page.dart';
import 'package:bengalapp/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const RoutePage(),
      const HomeScreen(),
      const UserPage(),
      const SettingsPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: GNav(
            haptic: true,
            tabBorderRadius: 15,
            curve: Curves.easeOutExpo,
            activeColor: theme.colorScheme.onSurface,
            duration: const Duration(milliseconds: 900),
            gap: 8,
            color: theme.colorScheme.onSurface,
            iconSize: 24, // tab button icon size
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: 30), // navigation bar padding
            tabBackgroundColor: Colors.grey
                .withOpacity(0.1), // background color for the selected tab
            onTabChange: _onItemTapped,
            tabs: const [
              GButton(
                icon: Icons.place,
                text: 'Rotas',
              ),
              GButton(
                icon: FontAwesomeIcons.personWalkingWithCane,
                text: 'Bengala',
              ),
              GButton(
                icon: Icons.person,
                text: 'Usuário',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Configurações',
              ),
            ]));
  }
}
