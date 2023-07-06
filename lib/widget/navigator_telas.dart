part of 'bnb_adm.dart';

int _currentBnb = 0;
void mudarTelaAdm(int x, BuildContext context) {
  if (x == 0) {
    _currentBnb = 0;
    Navigator.of(context).pushReplacementNamed('/');
  }
  if (x == 1) {
    _currentBnb = 1;
    Navigator.of(context).pushReplacementNamed('/produtos');
  }
  if (x == 2) {
    _currentBnb = 2;
    Navigator.of(context).pushReplacementNamed('/relatorios');
  }
  if (x == 3) {
    _currentBnb = 0;
    Navigator.of(context).pushNamed('/comandas');
  }
  if (x == 4) {
    _currentBnb = 0;
    Navigator.of(context).pushNamed('/pedidos');
  }
  if (x == 5) {
    _currentBnb = 0;
    Navigator.of(context).pushNamed('/funcionarios');
  }
  if (x == 6) {
    _currentBnb = 0;
    Navigator.of(context).pushNamed('/pagamentos');
  }
  if (x == 7) {
    _currentBnb = 0;
    Navigator.of(context).pushNamed('/tiposproduto');
  }
  if (x == 8) {
    _currentBnb = 0;
    Navigator.of(context).pushNamed('/caixa');
  }
  if (x == 9) {
    _currentBnb = 0;
    Navigator.of(context).pushNamed('/comandas/detail');
  }
}
