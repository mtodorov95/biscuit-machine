import 'package:biscuits/bin/biscuits/Biscuit.dart';

class Extruder {
  Biscuit pulse() {
    return _makeBiscuit();
  }

  Biscuit _makeBiscuit() {
    print('Extruding...');
    return Biscuit();
  }
}
