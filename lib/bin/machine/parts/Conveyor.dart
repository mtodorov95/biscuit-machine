import 'dart:collection';
import 'package:biscuits/bin/biscuits/Biscuit.dart';

class Conveyor {
  Queue<Biscuit> _biscuits;

  Conveyor() {
    _biscuits = Queue<Biscuit>();
  }

  int get biscuits => _biscuits.length;

  void add(Biscuit newBiscuit) {
    _biscuits.add(newBiscuit);
  }

  Biscuit removeFirst() {
    return _biscuits.removeFirst();
  }

  Biscuit getFirst() {
    return _biscuits.first;
  }
}
