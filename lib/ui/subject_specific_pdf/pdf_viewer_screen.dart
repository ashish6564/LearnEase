import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart'; // For controlling system orientation

class PdfViewerScreen extends StatefulWidget {
  final String filePath;

  const PdfViewerScreen({super.key, required this.filePath});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  bool isLoading = true;
  String localPath = "";
  bool isLandscape = false; // Flag to track the current orientation

  @override
  void initState() {
    super.initState();
    _downloadAndShowPdf(widget.filePath);
  }

  // Download and store PDF file from URL and then display it
  Future<void> _downloadAndShowPdf(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/${basename(url)}');
    await file.writeAsBytes(bytes);
    setState(() {
      localPath = file.path;
      isLoading = false;
    });
  }

  // Method to toggle between portrait and landscape orientations
  void _toggleOrientation() {
    setState(() {
      isLandscape = !isLandscape; // Toggle the orientation flag
    });

    if (isLandscape) {
      // Lock orientation to landscape
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      // Lock orientation to portrait
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  @override
  void dispose() {
    // Reset orientation to portrait when the screen is disposed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("PDF Viewer"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(isLandscape ? Icons.rotate_left : Icons.rotate_right),
              onPressed: _toggleOrientation, // Rotate the screen on button click
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: Container(
        //color: Colors.red,
        child: Lottie.asset('assets/lotty/loader_pdf.json',
            fit: BoxFit.cover),
      ),)
          : Center(
        child: PDFView(
          filePath: localPath,
        ),
      ),
    );
  }
}
