import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'screens/pokemon_screen.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.removeAfter(initaily);
  runApp(const MyApp());
}
 Future initaily(BuildContext? context) async{
    
    await Future.delayed(Duration(seconds: 2));
    
  }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonScreen(model: [],),
    );
  }
}

