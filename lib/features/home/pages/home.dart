import 'package:assignment/config/assets/app_images.dart';
import 'package:assignment/config/assets/app_vectors.dart';
import 'package:assignment/config/theme/app_color.dart';
import 'package:assignment/features/home/widgets/category_card.dart';
import 'package:assignment/features/home/widgets/featured_card.dart';
import 'package:assignment/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildHeader(context),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                
                //  Banner Area 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AspectRatio(
                    aspectRatio: 2.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(AppImages.banner, fit: BoxFit.cover), 
                    ),
                  ),
                ),
                
                // Categories 
                _buildSectionTitle('Categories'),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, 
                    itemBuilder: (context, index) => CategoryCard(
                      title: 'Example', 
                      imagePath: AppImages.demoitem, 
                    ),
                  ),
                ),

                //Featured Products
                _buildSectionTitle('Featured Products'),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => FeaturedCard(
                      title: 'Product', 
                      imagePath: AppImages.breadeggs, // Passed here
                    ),
                  ),
                ),

                // Grocery & Kitchen Grid
                _buildSectionTitle('Grocery & Kitchen'),
                _buildProductGrid(6), 

                // Snacks & Drinks Grid 
                _buildSectionTitle('Snacks & Drinks'),
                _buildProductGrid(6),

                //Beauty & Hygiene Grid
                _buildSectionTitle('Beauty & Hygiene'),
                _buildProductGrid(6),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Variables & Methods 

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildProductGrid(int itemCount) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(), 
      shrinkWrap: true,                              
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => ProductCard(
        title: 'Example', 
        imagePath: AppImages.demoitem,
      ),
    );
  }

  SliverAppBar _buildHeader(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false, 
      expandedHeight: 150, 
      pinned: true,
      elevation: 0,
      backgroundColor: AppColor.tealColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.tealColor, Colors.white],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 12, 
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppVectors.homepagelogo,
                      height: 24, 
                    ),
                    const CircleAvatar(
                      radius: 16, 
                      backgroundColor: Colors.white, 
                      child: Icon(Icons.person, color: Colors.grey, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.black, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'E-107 Golf links, Delhi • 16 min', 
                      style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Container(
            height: 45,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search for groceries...',
                hintStyle: TextStyle(fontSize: 14, color: AppColor.greyColor ),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                suffixIcon: Icon(Icons.mic, color: Colors.black),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}