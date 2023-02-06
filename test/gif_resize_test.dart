import 'package:flutter_test/flutter_test.dart';
import 'package:gif_resize/gif_resize.dart';
import 'package:gif_resize/gif_resize_platform_interface.dart';
import 'package:gif_resize/gif_resize_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGifResizePlatform
    with MockPlatformInterfaceMixin
    implements GifResizePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GifResizePlatform initialPlatform = GifResizePlatform.instance;

  test('$MethodChannelGifResize is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGifResize>());
  });

  test('getPlatformVersion', () async {
    GifResize gifResizePlugin = GifResize();
    MockGifResizePlatform fakePlatform = MockGifResizePlatform();
    GifResizePlatform.instance = fakePlatform;

    expect(await gifResizePlugin.getPlatformVersion(), '42');
  });
}
