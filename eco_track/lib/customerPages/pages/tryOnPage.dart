import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Tryonpage extends StatefulWidget {
  const Tryonpage({super.key});

  @override
  State<Tryonpage> createState() => _TryonpageState();
}

class _TryonpageState extends State<Tryonpage> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Virtual Try-On"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://huggingface.co/spaces/Kwai-Kolors/Kolors-Virtual-Try-On'),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          // Handle permissions like camera and file access
          return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT,
          );
        },
        onConsoleMessage: (controller, consoleMessage) {
          // Debugging console logs from the WebView
          debugPrint("Console: ${consoleMessage.message}");
        },
      ),
    );
  }
}
