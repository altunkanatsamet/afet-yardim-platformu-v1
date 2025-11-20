// FILE: lib/main.dart (Uygulama Giriş Noktası)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Firebase'i şimdilik kapalı tutuyoruz, önce ekranı görelim.
// import 'package:firebase_core/firebase_core.dart';

void main() {
  // Uygulamayı Riverpod (Durum Yönetimi) ile başlatıyoruz
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Afet Yardım Platformu',
      debugShowCheckedModeBanner: false, // Sağ üstteki 'Debug' bandını kaldırır
      theme: ThemeData(
        // Projemizin ana rengi kırmızı (Acil durum/Yardım teması)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade700),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.health_and_safety, size: 80, color: Colors.red),
              SizedBox(height: 20),
              Text(
                "Afet Yardım Platformu",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Sistem Başarıyla Çalıştı! 🚀",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}