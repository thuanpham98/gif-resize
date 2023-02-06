import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gif_resize_method_channel.dart';

abstract class GifResizePlatform extends PlatformInterface {
  /// Constructs a GifResizePlatform.
  GifResizePlatform() : super(token: _token);

  static final Object _token = Object();

  static GifResizePlatform _instance = MethodChannelGifResize();

  /// The default instance of [GifResizePlatform] to use.
  ///
  /// Defaults to [MethodChannelGifResize].
  static GifResizePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GifResizePlatform] when
  /// they register themselves.
  static set instance(GifResizePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init({int h = 64, int w = 128}) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<Uint8List> process(Uint8List d) {
    throw UnimplementedError('process() has not been implemented.');
  }

  Future<int> getWidth() {
    throw UnimplementedError('getWidth() has not been implemented.');
  }

  Future<int> getHeight() {
    throw UnimplementedError('getHeight() has not been implemented.');
  }

  Future<void> setWidth({int w = 128}) {
    throw UnimplementedError('setWidth() has not been implemented.');
  }

  Future<void> setHeight({int h = 64}) {
    throw UnimplementedError('setHeight() has not been implemented.');
  }
}
