import 'package:assignment/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const ProductCard({
    super.key, 
    required this.title, 
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1), 
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover, 
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color:AppColor.tealColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}