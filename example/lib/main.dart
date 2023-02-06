import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gif_resize/gif_resize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _gifResizePlugin = GifResize();
  Uint8List? dataImage;

  @override
  void initState() {
    super.initState();
  }

  Future<void> resize() async {
    if (!mounted) return;
    ByteData byteData = await rootBundle.load('assets/test.gif');
    Uint8List bytes = byteData.buffer.asUint8List();
    await _gifResizePlugin.init(h: 200, w: 200);
    print(await _gifResizePlugin.getHeight());
    print(await _gifResizePlugin.getWidth());

    await _gifResizePlugin.setHeight(h: 64);
    await _gifResizePlugin.setWidth(w: 128);

    print(await _gifResizePlugin.getHeight());
    print(await _gifResizePlugin.getWidth());

    Uint8List resized = await _gifResizePlugin.process(bytes);
    setState(() {
      dataImage = resized;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: [
            Image.asset('assets/test.gif'),
            const SizedBox(
              height: 32,
            ),
            dataImage == null
                ? const SizedBox.shrink()
                : Image.memory(dataImage!)
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await resize();
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
      ),
    );
  }
}
