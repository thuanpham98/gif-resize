import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gif_resize_platform_interface.dart';

enum GifResizeMethod {
  init('init'),
  process('process'),
  getHeight('get_height'),
  setHeight('set_height'),
  getWidth('get_width'),
  setWidth('set_width');

  const GifResizeMethod(this.method);
  final String method;

  @override
  String toString() => 'Method : $method';
}

/// An implementation of [GifResizePlatform] that uses method channels.
class MethodChannelGifResize extends GifResizePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gif_resize');

  @override
  Future<void> init({int h = 64, int w = 128}) async {
    await methodChannel.invokeMethod<void>(
        GifResizeMethod.init.method, {'width': w, 'height': h});
  }

  @override
  Future<Uint8List> process(Uint8List d) async {
    final Uint8List ret = await methodChannel.invokeMethod<Uint8List>(
            GifResizeMethod.process.method, {'data': d}) ??
        Uint8List.fromList([]);
    return ret;
  }

  @override
  Future<int> getWidth() async {
    final int ret = await methodChannel
            .invokeMethod<int>(GifResizeMethod.getWidth.method) ??
        0;
    return ret;
  }

  @override
  Future<int> getHeight() async {
    final int ret = await methodChannel
            .invokeMethod<int>(GifResizeMethod.getHeight.method) ??
        0;
    return ret;
  }

  @override
  Future<void> setWidth({int w = 128}) async {
    await methodChannel
        .invokeMethod<void>(GifResizeMethod.setWidth.method, {'data': w});
  }

  @override
  Future<void> setHeight({int h = 64}) async {
    await methodChannel
        .invokeMethod<void>(GifResizeMethod.setHeight.method, {'data': h});
  }
}
