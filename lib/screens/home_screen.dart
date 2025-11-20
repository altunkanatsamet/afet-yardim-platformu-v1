// FILE: lib/screens/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Afet Yardım Platformu"),
        centerTitle: true,
        actions: [
          // Çıkış Yap Butonu
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context); // Giriş ekranına geri atar
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Durumunu Seç",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // 🚨 KIRMIZI BUTON (YARDIM İSTİYORUM)
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  print("Yardım İstiyorum seçildi");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emergency, size: 60),
                    SizedBox(height: 10),
                    Text("YARDIM İSTİYORUM", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Afetzedeyim", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),

            // 🤝 YEŞİL BUTON (GÖNÜLLÜYÜM)
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  print("Gönüllü Ol seçildi");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.volunteer_activism, size: 60),
                    SizedBox(height: 10),
                    Text("GÖNÜLLÜYÜM", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Yardım Etmek İstiyorum", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}