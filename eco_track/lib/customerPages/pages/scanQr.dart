import 'dart:convert';

import 'package:eco_track/deliveryPartnerPages/mapInterface.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  final String userType; // Either 'customer' or 'deliveryPartner'

  const QRScannerPage({Key? key, required this.userType}) : super(key: key);

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _isProcessing = false;
  dynamic decodedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.userType.toUpperCase()} Scanner"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      if (_isProcessing) return; // Ignore subsequent scans
      _isProcessing = true;

      if (scanData.code != null) {
        try {
          // Decode JSON data from QR code
          decodedData = jsonDecode(scanData.code!);

          if (decodedData is List) {
            // Filter data based on user type
            Map<String, dynamic>? filteredData = decodedData.firstWhere(
              (item) => item['userType'] == widget.userType,
              orElse: () => null,
            );

            if (filteredData != null) {
              // Show details in a dialog
              _showDetailsDialog(filteredData);
            } else {
              _showSnackBar("No details found for ${widget.userType}.");
            }
          } else {
            _showSnackBar("Invalid QR code data.");
          }
        } catch (e) {
          _showSnackBar("Error decoding QR code.");
        } finally {
          _isProcessing = false;
        }
      } else {
        _showSnackBar("No data found in QR code.");
        _isProcessing = false;
      }
    });
  }

  void _showDetailsDialog(Map<String, dynamic> details) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Details for ${widget.userType}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: details.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Text("${entry.key}: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text("${entry.value}")),
                ],
              ),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
