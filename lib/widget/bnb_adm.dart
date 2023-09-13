import 'package:flutter/material.dart';
part '../navigator_telas.dart';

BottomNavigationBar bnbAdm(context, int? current) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Home',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard), label: 'Produtos'),
      BottomNavigationBarItem(
          icon: Icon(Icons.assessment_outlined), label: 'Relatórios')
    ],
    currentIndex: _currentBnb,
    onTap: (value) {
      String? rotaAtual = ModalRoute.of(context)?.settings.name;
      if (current != null) {
        Navigator.pop(context);
      }
      if (value == 0) {
        if (rotaAtual == '/') {
          Navigator.of(context).pushReplacementNamed('/');
          _currentBnb = 0;
        } else {
          _currentBnb = 0;
          Navigator.of(context).pushReplacementNamed('/');
        }
      }
      if (value == 1) {
        _currentBnb = 1;
        Navigator.of(context).pushReplacementNamed('/produtos');
      }
      if (value == 2) {
        _currentBnb = 2;
        Navigator.of(context).pushReplacementNamed('/relatorios');
      }
    },
  );
}
