import 'package:ecommerce_finalproject/bloc/Auth_cubit/auth_cubit.dart';
import 'package:ecommerce_finalproject/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_finalproject/bloc/category/category_bloc.dart';
import 'package:ecommerce_finalproject/bloc/product/product_bloc.dart';
import 'package:ecommerce_finalproject/bloc/wishlist_bloc.dart';
import 'package:ecommerce_finalproject/config/app_router.dart';
import 'package:ecommerce_finalproject/model/cart_model.dart';
import 'package:ecommerce_finalproject/model/wish_list_model.dart';
import 'package:ecommerce_finalproject/repositories/category/category_repositoriy.dart';
import 'package:ecommerce_finalproject/repositories/product/product_repository.dart';
import 'package:ecommerce_finalproject/view/screens/Home_screen.dart';
import 'package:ecommerce_finalproject/view/screens/Login_screen.dart';
import 'package:ecommerce_finalproject/view/screens/login2.dart';
import 'package:ecommerce_finalproject/view/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistCubit()..startWishlist()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(
            create: (_) => ProductCubit(
                  productRepository: ProductRepository(),
                )),
        BlocProvider(
          create: (_) => CategoryCubit(
            categoryRepository: CategoryRepository(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          // home:  LoginScreen(),
        ),
      ),
    );
  }
}
