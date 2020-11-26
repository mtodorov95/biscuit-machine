import 'package:biscuits/bin/biscuits/Biscuit.dart';

class Stamper {
  void pulse(Biscuit newBiscuit) {
    print('Shaping...');
    newBiscuit.isShaped = true;
  }
}
