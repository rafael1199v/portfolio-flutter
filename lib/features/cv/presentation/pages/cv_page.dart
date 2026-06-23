import 'package:flutter/material.dart';

import '../../../../core/theme/cv_theme.dart';
import '../../data/cv_data.dart';
import '../../services/cv_pdf_exporter.dart';
import '../widgets/cv_body.dart';
import '../widgets/cv_header.dart';

class CvScreen extends StatefulWidget {
  const CvScreen({super.key});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  bool _exporting = false;

  Future<void> _exportPdf() async {
    if (_exporting) return;
    setState(() => _exporting = true);

    final navigator = Navigator.of(context, rootNavigator: true);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const _GeneratingPdfDialog(),
    );

    await WidgetsBinding.instance.endOfFrame;
    if (!mounted) {
      navigator.pop();
      return;
    }

    try {
      await CvPdfExporter.exportAndShare(
        context: context,
        document: const ColoredBox(
          color: CvColors.background,
          child: CvContent(isWide: true),
        ),
        logicalWidth: kMaxContentWidth,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se pudo generar el PDF: $e')),
        );
      }
    } finally {
      navigator.pop();
      if (mounted) setState(() => _exporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CvColors.background,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _exporting ? null : _exportPdf,
        backgroundColor: CvColors.accent,
        foregroundColor: Colors.white,
        icon: _exporting
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.picture_as_pdf_outlined),
        label: Text(_exporting ? 'Generando…' : 'Exportar PDF'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= kWideBreakpoint;
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
                  child: CvContent(isWide: isWide),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GeneratingPdfDialog extends StatelessWidget {
  const _GeneratingPdfDialog();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: CvColors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: CvColors.accent,
                ),
              ),
              SizedBox(width: 18),
              Text(
                'Generando PDF…',
                style: TextStyle(fontSize: 15, color: CvColors.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CvContent extends StatelessWidget {
  final bool isWide;

  const CvContent({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    const data = cvData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CvHeader(data: data, isWide: isWide),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 40 : 24,
            vertical: isWide ? 32 : 24,
          ),
          child: isWide
              ? const CvWideBody(data: data)
              : const CvNarrowBody(data: data),
        ),
      ],
    );
  }
}
