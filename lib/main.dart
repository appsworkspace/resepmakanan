import 'package:flutter/material.dart';
import 'package:resepmakanan/screen/resep_makanan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resep Makanan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResepMakananScreen(),
    );
  }
}
