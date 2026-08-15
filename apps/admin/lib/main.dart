import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PrivateAgentAdminApp());
}

class PrivateAgentAdminApp extends StatelessWidget {
  const PrivateAgentAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFFF304F);
    const blue = Color(0xFF07132F);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PrivateAgent Admin',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: red,
          brightness: Brightness.dark,
          surface: const Color(0xFF0C1A3A),
        ),
        fontFamily: 'sans',
      ),
      home: const DashboardScreen(),
    );
  }
}
