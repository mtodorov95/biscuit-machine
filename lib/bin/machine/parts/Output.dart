import 'package:biscuits/bin/biscuits/Biscuit.dart';

class Output {
  List<Biscuit> _biscuits;

  Output() {
    _biscuits = List<Biscuit>();
  }

  void add(Biscuit newBiscuit) {
    _biscuits.add(newBiscuit);
  }

  int amount() {
    return _biscuits.length;
  }
}
