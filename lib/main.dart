import 'package:flutter/material.dart';
import 'package:flutter_learning/provider/count_provider.dart';
import 'package:flutter_learning/provider/providerHomeScreen.dart';
import 'package:flutter_learning/view/databaseScreen.dart';
import 'package:flutter_learning/view/homeScreen.dart';
import 'package:flutter_learning/view/rive.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(), ),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        home:  const RiveLogin(),
      ),


    );
  }
}


