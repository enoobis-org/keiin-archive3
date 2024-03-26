import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'enomatic',
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '360'
        ..src = 'https://enoobis-org.github.io/enomatic/'
        ..style.border = 'none'
        ..style.overflow = 'hidden');

  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: SizedBox(
      width: 500,
      height: 500,
      child: HtmlElementView(viewType: 'enomatic'),
    ),
  ));
}
