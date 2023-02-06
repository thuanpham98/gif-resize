import 'package:flutter/foundation.dart';

import 'gif_resize_platform_interface.dart';

class GifResize {
  Future<void> init({int w = 128, int h = 64}) async {
    return await GifResizePlatform.instance.init(h: h, w: w);
  }

  Future<Uint8List> process(Uint8List d) async {
    return await GifResizePlatform.instance.process(d);
  }

  Future<int> getWidth() async {
    return await GifResizePlatform.instance.getWidth();
  }

  Future<int> getHeight() async {
    return await GifResizePlatform.instance.getHeight();
  }

  Future<void> setWidth({int w = 128}) async {
    return await GifResizePlatform.instance.setWidth(w: w);
  }

  Future<void> setHeight({int h = 64}) async {
    return await GifResizePlatform.instance.setHeight(h: h);
  }
}
