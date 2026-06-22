import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class _CapturedImage {
  final Uint8List pixels;
  final int width;
  final int height;

  const _CapturedImage({
    required this.pixels,
    required this.width,
    required this.height,
  });
}


class CvPdfExporter {
  static Future<_CapturedImage> _captureOffscreen({
    required BuildContext context,
    required Widget child,
    required double logicalWidth,
    double pixelRatio = 2.0,
  }) async {
    final repaintKey = GlobalKey();
    final overlay = Overlay.of(context, rootOverlay: true);

    final entry = OverlayEntry(
      builder: (_) => Positioned(
        left: -logicalWidth - 200,
        top: 0,
        child: Material(
          type: MaterialType.transparency,
          child: RepaintBoundary(
            key: repaintKey,
            child: SizedBox(width: logicalWidth, child: child),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    try {
      await WidgetsBinding.instance.endOfFrame;
      final boundary = repaintKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: pixelRatio);
      final byteData = await image.toByteData(
        format: ui.ImageByteFormat.rawRgba,
      );
      final captured = _CapturedImage(
        pixels: byteData!.buffer.asUint8List(),
        width: image.width,
        height: image.height,
      );
      image.dispose();
      return captured;
    } finally {
      entry.remove();
    }
  }

  static Future<Uint8List> _buildPdf(_CapturedImage capture) async {
    final image = pw.RawImage(
      bytes: capture.pixels,
      width: capture.width,
      height: capture.height,
    );
    final width = PdfPageFormat.a4.width;
    final height = width * capture.height / capture.width;

    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(width, height),
        margin: pw.EdgeInsets.zero,
        build: (context) => pw.Image(image, fit: pw.BoxFit.fill),
      ),
    );
    return doc.save();
  }

  static Future<void> exportAndShare({
    required BuildContext context,
    required Widget document,
    double logicalWidth = 1000,
  }) async {
    final capture = await _captureOffscreen(
      context: context,
      child: document,
      logicalWidth: logicalWidth,
    );
    final pdf = await _buildPdf(capture);
    await Printing.layoutPdf(
      onLayout: (_) async => pdf,
      name: 'CV_Rafael_Vargas',
    );
  }
}
