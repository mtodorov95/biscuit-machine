import 'dart:async';
import 'package:biscuits/models/biscuits/Biscuit.dart';

class Output {
  List<Biscuit> _biscuits;
  StreamController<int> _streamController;

  Output() {
    _biscuits = List<Biscuit>();
    _streamController = StreamController();
    _streamController.add(_biscuits.length);
  }

  Stream<int> get amount => _streamController.stream;

  void add(Biscuit newBiscuit) {
    _biscuits.add(newBiscuit);
    _streamController.add(_biscuits.length);
  }

}
