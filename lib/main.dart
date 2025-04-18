import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/recover_password_screen.dart';
import 'screens/main_menu_screen.dart';
import 'screens/jornada_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/jornadas_screen.dart';
import 'screens/full_map_screen.dart';

void main() {
  runApp(const MonitoramentoApp());
}

class MonitoramentoApp extends StatelessWidget {
  const MonitoramentoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoramento de Equipamentos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/recover-password': (context) => const RecoverPasswordScreen(),
        '/menu': (context) => const MainMenuScreen(),
        '/jornadas': (context) => const JornadasScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/full-map': (context) => const FullMapScreen(),
      },
    );
  }
}
