import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gif_resize/gif_resize_method_channel.dart';

void main() {
  MethodChannelGifResize platform = MethodChannelGifResize();
  const MethodChannel channel = MethodChannel('gif_resize');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
