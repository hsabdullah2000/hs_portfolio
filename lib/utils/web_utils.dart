import 'package:flutter/foundation.dart' show kIsWeb;

// Use conditional compilation for web-specific imports
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' if (dart.library.html) 'dart:html' as html;

/// Opens a PDF file in a new tab (web only)
void openPdf(String path) {
  if (kIsWeb) {
    try {
      // Use a safer approach that doesn't rely on explicit dart:html
      final anchorElement =
          html.AnchorElement(href: path)
            ..target = '_blank'
            ..rel = 'noopener noreferrer'
            ..click();
    } catch (e) {
      // Fallback mechanism if direct opening fails
      print('Failed to open PDF: $e');
    }
  } else {
    print('PDF viewing is only supported on web');
  }
}
