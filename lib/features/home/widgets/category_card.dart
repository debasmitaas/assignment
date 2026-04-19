import 'package:assignment/config/theme/app_text_styles.dart';
import 'package:assignment/core/extensions/extension_methods.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key, 
    required this.title, 
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getResponsiveWidth(100), 
      margin: const EdgeInsets.only(right: 12, bottom: 6, top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 6, 6, 0), 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12), 
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover, 
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    title,
                    style: AppTextStyles.cardText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}