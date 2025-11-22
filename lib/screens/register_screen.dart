// FILE: lib/screens/register_screen.dart

import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // Az önce yazdığımız servisi çağırdık

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  final _authService = AuthService(); // Servisi başlattık

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Hesap Oluştur", textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),

              // İSİM
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Adın Soyadın", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 16),

              // E-POSTA
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "E-posta Adresi", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 16),

              // ŞİFRE
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Şifre Belirle", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 30),

              // KAYIT OL BUTONU
              ElevatedButton(
                onPressed: _isLoading ? null : () async {
                  // 1. Yükleniyor simgesini aç
                  setState(() => _isLoading = true);

                  // 2. Servise git ve kayıt olmaya çalış
                  String? error = await _authService.registerUser(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );

                  // 3. İşlem bitince yükleniyor simgesini kapat
                  setState(() => _isLoading = false);

                  if (error == null) {
                    // BAŞARILI! (Hata yok)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Kayıt Başarılı! Giriş yapabilirsiniz."), backgroundColor: Colors.green),
                    );
                    Navigator.pop(context); // Giriş ekranına geri yolla
                  } else {
                    // HATA VAR!
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Hata: $error"), backgroundColor: Colors.red),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading 
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Hesap Oluştur", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}