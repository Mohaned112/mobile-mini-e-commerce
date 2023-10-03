import 'package:ecommerce_finalproject/model/categorry_models.dart';
import 'package:ecommerce_finalproject/model/models.dart';
import 'package:ecommerce_finalproject/view/screens/Home_screen.dart';
import 'package:ecommerce_finalproject/view/screens/Login_screen.dart';
import 'package:ecommerce_finalproject/view/screens/cart/cart_screen.dart';
import 'package:ecommerce_finalproject/view/screens/catalog/catalog_screen.dart';
import 'package:ecommerce_finalproject/view/screens/product/product_screen.dart';
import 'package:ecommerce_finalproject/view/screens/splash/splash_screen.dart';
import 'package:ecommerce_finalproject/view/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/screens/Register_screen.dart';

class AppRouter{
  static Route? onGenerateRoute(RouteSettings settings){
    print('This is route:  ${settings.name}');

    switch (settings.name) {

      case'/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case RegisterScreen.routeName:
        return RegisterScreen.route();
        case LoginScreen.routeName:
      return LoginScreen.route();



      default:
        return _errorRoute();
    }
}
   static Route  _errorRoute(){
     return MaterialPageRoute(
       settings: RouteSettings(name: '/'),
       builder:(_) => Scaffold(appBar:AppBar(
         title:Text('Error')),
     ),
     );
   }

}
