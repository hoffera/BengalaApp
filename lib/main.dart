import 'package:bengalapp/firebase_options.dart';
import 'package:bengalapp/theme/theme_provider.dart';
import 'package:bengalapp/view/bengal_page.dart';
import 'package:bengalapp/view/controlscreen.dart';
import 'package:bengalapp/view/home_home_page.dart';
import 'package:bengalapp/view/home_page.dart';
import 'package:bengalapp/view/login_page.dart';
import 'package:bengalapp/view/navpage.dart';
import 'package:bengalapp/view/register_page.dart';
import 'package:bengalapp/view/route_page.dart';
import 'package:bengalapp/view/settings_page.dart';
import 'package:bengalapp/view/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const RouteScreens(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => const HomePage(),
        '/homeHomePage': (BuildContext context) => const HomeHomePage(),
        '/registerPage': (BuildContext context) => const RegisterPage(),
        '/LoginPage': (BuildContext context) => const LoginPage(),
        '/NavPage': (BuildContext context) => const NavPage(),
        '/routePage': (BuildContext context) => const RoutePage(),
        '/bengalPage': (BuildContext context) => const BengalPage(),
        '/settingsPage': (BuildContext context) => const SettingsPage(),
        '/userPage': (BuildContext context) => const UserPage(),
        '/controllPage': (BuildContext context) => Builder(
              builder: (context) {
                final BluetoothDevice device = ModalRoute.of(context)!
                    .settings
                    .arguments as BluetoothDevice;
                return ControlScreen(device: device);
              },
            ),
      },
    );
  }
}

class RouteScreens extends StatelessWidget {
  const RouteScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            // final user = FirebaseAuth.instance.currentUser;
            return const NavPage();
          } else {
            return const HomePage();
          }
        }
      },
    );
  }
}
