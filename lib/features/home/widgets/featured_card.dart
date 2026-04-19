import 'package:assignment/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double rating;
  final VoidCallback? onTap;

  const FeaturedCard({
    super.key, 
    required this.title, 
    required this.imagePath, 
    this.rating = 5.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12, bottom: 6, top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade900, width: 1.5), 
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
          borderRadius: BorderRadius.circular(14), 
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0), 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11), 
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
              
              Positioned(
                top: 30, 
                left: 8,
                right: 8,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Featured $title',
                    style:AppTextStyles.cardText
                  ),
                ),
              ),

              //Top Notch
              Positioned(
                top: 4, 
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8), 
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Featured', 
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 11, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Notch 
              Positioned(
                bottom: 4, 
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.star, size: 14, color: Colors.amber),
                        SizedBox(width: 4),
                        Icon(Icons.star, size: 14, color: Colors.amber),
                      ],
                    ),
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