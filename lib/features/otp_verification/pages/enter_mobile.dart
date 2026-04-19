import 'package:assignment/features/otp_verification/pages/otp_verification.dart';
import 'package:assignment/features/otp_verification/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class EnterMobile extends StatelessWidget {
  const EnterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // Shared border style for the input field
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF176272), width: 1.0),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Title
              const Text(
                'Enter Your Mobile Number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),

              //Subtitle
              const Text(
                "Lets create or find your account. We'll send you a security code to verify that its really you.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              //Form Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Country Code Container
                  Container(
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF176272),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '+91',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF334155),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('🇮🇳', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Phone Number Input Field
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Mobile no.',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF94A3B8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          border: borderStyle,
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle.copyWith(
                            borderSide: const BorderSide(
                              color: Color(0xFF0F9687),
                              width: 1.5,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Button
              const Spacer(),

              Center(
                child: PrimaryButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpVerification(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
