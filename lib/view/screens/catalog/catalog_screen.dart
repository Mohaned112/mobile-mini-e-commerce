import 'package:ecommerce_finalproject/bloc/category/category_bloc.dart';
import 'package:ecommerce_finalproject/bloc/category/category_bloc.dart';
import 'package:ecommerce_finalproject/model/categorry_models.dart';
import 'package:ecommerce_finalproject/model/models.dart';
import 'package:ecommerce_finalproject/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/product/product_bloc.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();

    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: customBottomAppBar(context),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.15),
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: state.products[index],
                      widthFactor: 2.2,
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        },
      ),

      //ProductCard(product: Product.products[0],),
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
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user');
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      leading: const Icon(Icons.arrow_back),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Text(
          'Catalog',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        )
      ],
    );
  }
}
