import 'package:coffee_shop/controllers/itembag_controller.dart';
import 'package:coffee_shop/controllers/product_controller.dart';
import 'package:coffee_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../widgets/ads_banner_widget.dart';
import '../widgets/button_primary.dart';
import '../widgets/card_widget.dart';
import '../widgets/chip_widget.dart';
import 'cart_page.dart';
import 'detail_page.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProductModel> products = ref.watch(proudctNotifierProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    final itemBag = ref.watch(itemBagProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 62, 6),
        title: Center(
            child: Text(
          'Coffee Shop',
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhiteColor),
        )),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Badge(
                label: Text(itemBag.length.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CardPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.local_mall,
                      size: 24,
                      color:Colors.white,
                    )),
              ))
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // Ads banner section
              const AdsBannerWidget(),
              // Chip section
              SizedBox(
                height: 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    ChipWidget(chipLabel: 'All Coffee'),
                    ChipWidget(chipLabel: 'Machiato'),
                    ChipWidget(chipLabel: 'Ice coffee'),
                    ChipWidget(chipLabel: 'Latte'),
                    ChipWidget(chipLabel: 'Cappuccino'),
                    ChipWidget(chipLabel: 'Americano'),
                  ],
                ),
              ),
              // Hot sales section
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Hot Coffee', style: AppTheme.kHeadingOne),
                  Text(
                    'See all',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ProductCardWidget(productIndex: index),
                ),
              ),
              // Featured products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Ice Coffee', style: AppTheme.kHeadingOne),
                  Text(
                    'See all',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),

              MasonryGridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                shrinkWrap: true,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(getIndex: index),
                      )),
                  child: SizedBox(
                    height: 250,
                    child: ProductCardWidget(productIndex: index),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.read(currentIndexProvider.notifier).update((state) => value),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Location',
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
            activeIcon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
