import 'package:flutter/material.dart';
// 1. Import file dashboard Anda (pastikan namanya sesuai dengan file di folder lib Anda)
import 'page_dashboard.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FILKOM Apps Redesign',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di pojok kanan
      theme: ThemeData(
        useMaterial3: true,
      ),
      // 2. Ganti text polos tadi dengan memanggil class dari page_dashboard.dart
      home: const page_dashboard(), 
    );
  }
}