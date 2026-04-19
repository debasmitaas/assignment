import 'package:assignment/config/theme/app_text_styles.dart';
import 'package:assignment/features/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SplashPage(),theme: AppTheme.lightTheme,);
  }
}
