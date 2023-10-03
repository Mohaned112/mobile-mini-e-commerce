import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_finalproject/widgets/product_carousel.dart';
import 'package:ecommerce_finalproject/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/category/category_bloc.dart';
import '../../bloc/product/product_bloc.dart';
import '../../widgets/hero_carousel_card.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      bottomNavigationBar: customBottomAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: state.categories
                          .map((category) => HeroCaruseCard(category: category))
                          .toList(),
                    );
                  } else {
                    return const Text('Something Went Wrong');
                  }
                },
              ),
            ),
            const SectionTitle(title: 'RECOMMENDED'),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is ProductLoaded){
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList());
                }else{
                  return const Text('Something went wrong');
                }

              },
            ),

            const SectionTitle(title: 'MOST POPULAR'),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is ProductLoaded){
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isPopular)
                          .toList());
                }else{
                  return const Text('Something went wrong');
                }

              },
            ),
          ],
        ),
      ),
    );
  }

  BottomAppBar customBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
        Navigator.pop(context);
      },),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          'Welcome To Market',
          style: Theme
              .of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/wishlist');
          },
          icon: const Icon(Icons.favorite),
        )
      ],
    );
  }
}
