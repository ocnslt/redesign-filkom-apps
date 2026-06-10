import 'package:flutter/material.dart';
import 'page_dashboard.dart';
import 'page_profil.dart';
import 'page_konseling.dart';
import 'page_not_found.dart';

void main() {
  runApp(const FilkomApps());
}

class FilkomApps extends StatelessWidget {
  const FilkomApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FILKOM Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF1F5F9), 
        primaryColor: const Color(0xFF1E3A8A),
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => const PageDashboard(),
        '/profil': (context) => const PageProfil(),
        '/konseling': (context) => const PageKonseling(),
        '/not-found': (context) => const PageNotFound(),
      },
    );
  }
}     