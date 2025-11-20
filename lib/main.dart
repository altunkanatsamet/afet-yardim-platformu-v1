// FILE: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// İşte o dosya bağlantısını (import) buraya ekliyoruz:
import 'screens/login_screen.dart'; 

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Afet Yardım Platformu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade700),
        useMaterial3: true,
      ),
      // Artık diğer dosyadan çağırdığımız için hata vermeyecek:
      home: const LoginScreen(), 
    );
  }
}