import 'package:dynamic_color/dynamic_color.dart';
import 'package:dynamicapp/login/2.0%20login.dart';
import 'package:dynamicapp/login/login.dart';
import 'package:dynamicapp/models/cart.dart';
import 'package:dynamicapp/models/catalog.dart';
import 'package:dynamicapp/theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
      return MultiProvider(
          providers: [
            Provider(create: (context) => CatalogModel()),
            ChangeNotifierProxyProvider<CatalogModel, CartModel>(
              create: (context) => CartModel(),
              update: (context, catalog, cart) {
                if (cart == null) throw ArgumentError.notNull('cart');
                cart.catalog = catalog;
                return cart;
              },
            ),
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              // theme: ThemeData(useMaterial3: true),

              theme: AppTheme.lightTheme(lightColorScheme),
              darkTheme: AppTheme.darkTheme(darkColorScheme),
              // routerConfig: router(),

              home: const Login2()));
    });
  }
}
