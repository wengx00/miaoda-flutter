import 'dart:math';
import 'dart:ui';

class Tools {
  static Color randomColor(
      {int seed = 0, int top = 255, int? r, int? g, int? b}) {
    final color = Color.fromARGB(
        255,
        max(0, min(255, Random().nextInt(r ?? top) + seed)),
        max(0, min(255, Random().nextInt(g ?? top) + seed)),
        max(0, min(255, Random().nextInt(b ?? top) + seed)));
    print(color);
    return color;
  }
}
