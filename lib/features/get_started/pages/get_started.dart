import 'package:assignment/config/assets/app_vectors.dart';
import 'package:assignment/config/theme/app_color.dart';
import 'package:assignment/core/extensions/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.tealColor,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ── Logo area ──────────────────────────────────────────
              const Expanded(
                child: Center(
                  child: _Root5Logo(),
                ),
              ),

              // ── Buttons + disclaimer ───────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  children: [
                    // Continue with OTP
                    _OtpButton(onTap: () {}),

                    const SizedBox(height: 14),

                    // Continue with Google
                    _GoogleButton(onTap: () {}),

                    const SizedBox(height: 20),

                    // Disclaimer text
                    const _DisclaimerText(),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Logo
class _Root5Logo extends StatelessWidget {
  const _Root5Logo();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppVectors.welcomelogo, width: context.getResponsiveWidth(245), height: context.getResponsiveHeight(82.2),);
  }
}

// OTP Button  

class _OtpButton extends StatelessWidget {
  const _OtpButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0A6B60),   // dark teal
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
        ),
        icon: const Icon(Icons.phone, size: 20),
        label: const Text(
          'Continue with OTP',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}

// Google Button
class _GoogleButton extends StatelessWidget {
  const _GoogleButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF176272), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _GoogleGIcon(),
            const SizedBox(width: 10),
            const Text(
              'Continue with Google',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _GoogleGIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppVectors.devicongoogle);
  }
}


// Disclaimer Text
class _DisclaimerText extends StatelessWidget {
  const _DisclaimerText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF1F2A3A),
          height: 1.5,
        ),
        children: [
          const TextSpan(text: 'By continuing you agree to our '),
          TextSpan(
            text: 'Terms & Conditions',
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xFF1F2A3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xFF1F2A3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(
            text:
                ' and receiving calls from us even if your number is registered with NCPR.',
          ),
        ],
      ),
    );
  }
}