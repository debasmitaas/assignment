import 'package:assignment/config/theme/app_color.dart';
import 'package:assignment/config/theme/app_text_styles.dart';
import 'package:assignment/features/home/pages/home.dart';
import 'package:assignment/features/otp_verification/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerification extends StatelessWidget {
  final String phoneNumber;

  const OtpVerification({
    super.key,
    this.phoneNumber = '+91 xxxxxx4056',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: [
          // Help Button 
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.tealColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Help',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              
              // Title 
              Text(
                'We just sent you an SMS',
                style: AppTextStyles.title1
              ),
              const SizedBox(height: 12),
              
              // Subtitle 
              Text(
                'Enter the security code we sent to\n$phoneNumber',
                style: AppTextStyles.subtitleText
              ),
              const SizedBox(height: 32),

              //OTP Inputs
              const _OtpInputRow(),

              const SizedBox(height: 16),
              
              // Resend Text 
              const Text(
                'Resend OTP in 00:14',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGreyColor,
                ),
              ),

              const Spacer(),
              
              // Verify Button 
              Center(
                child: PrimaryButton(
                  text: 'Verify',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
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
class _OtpInputRow extends StatelessWidget {
  const _OtpInputRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, 
      children: List.generate(6, (index) {
        return Padding(
          padding: EdgeInsets.only(right: index < 5 ? 7.0 : 0),
          child: SizedBox(
            width: 40,
            height: 40,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.bluetealColor, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColor.darkGreenBorderColor, width: 1.5),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
