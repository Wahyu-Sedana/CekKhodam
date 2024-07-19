import 'dart:math';

import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  final TextEditingController _inputNamaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String result = '';
  String queotes = '';

  set setInputNama(val) {
    _inputNamaController.text = val;
    notifyListeners();
  }

  TextEditingController get inputNamaController => _inputNamaController;
  GlobalKey<FormState> get formKey => _formKey;

  final List<String> _khodamQuotes = [
    "Kalau khodamnya santuy, siapa yang mau tegang?",
    "Khodam juga butuh cuti, biar nggak jadi hantu mati gaya.",
    "Hidup tanpa khodam itu seperti pocong tanpa tali pengikat.",
    "Khodam ceria, hidup bahagia.",
    "Biar khodam aja yang ribet, kita santuy aja.",
    "Khodam banyak gaya, kita tetap sederhana.",
    "Khodam ngocol, mood jadi ga kesel.",
    "Ketika khodam bosan, kita yang jadi korban.",
    "Khodam lucu bikin hidup nggak sendu.",
    "Khodam juga butuh me time, jangan diganggu terus!",
  ];

  final List<String> _khodamNames = [
    'Tidak Ada',
    'Tidak Ada',
    'Tidak Ada',
    'Pocong Ngesot',
    'Kunti Tobrut',
    'Tuyul Centil',
    'Suster Keserimpet',
    'Genderuwo Santuy',
    'Wewe Gombel Kocak',
    'Kuntilanak Gocek',
    'Pocong Zumba',
    'Leak Ngakak',
    'Jenglot Santai',
    'Babi Ngepet Lucu',
    'Tuyul Beken',
    'Hantu Kipas Angin',
    'Pocong Joget',
    'Kunti Kocak',
    'Sundel Bolong Rileks',
    'Setan Ngelawak',
    'Suster Ngabuburit',
    'Kuntilanak Karaoke',
    'Genderuwo Ngocol',
  ];

  Future<String> getRandomKhodam() async {
    await Future.delayed(const Duration(seconds: 1));
    final random = Random();
    result = _khodamNames[random.nextInt(_khodamNames.length)];
    queotes = _khodamQuotes[random.nextInt(_khodamQuotes.length)];
    return result;
  }

  void reset() {
    _inputNamaController.clear();
    result = '';
    queotes = '';
  }
}
