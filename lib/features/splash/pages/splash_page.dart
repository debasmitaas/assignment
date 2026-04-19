import 'package:assignment/config/assets/app_vectors.dart';
import 'package:assignment/core/extensions/extension_methods.dart';
import 'package:assignment/features/get_started/pages/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: 
            Center(
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 65.23),
                child: SvgPicture.asset(
                  AppVectors.splashlogo,
                  width: context.getResponsiveWidth(360),
                  height: context.getResponsiveHeight(154.1),
                  
                ),
              ),
            ),
  
      ),
    );
  }
  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const GetStarted())
      );
    }
  }
}