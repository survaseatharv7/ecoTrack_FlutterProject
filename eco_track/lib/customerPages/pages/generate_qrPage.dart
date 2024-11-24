import 'dart:convert';

import 'package:eco_track/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GenerateQRCodePage extends StatefulWidget {
  const GenerateQRCodePage({super.key});

  @override
  _GenerateQRCodePageState createState() => _GenerateQRCodePageState();
}

class _GenerateQRCodePageState extends State<GenerateQRCodePage> {
  String qrData = "";

  List qrDetailsList = [
    {
      'userType': 'customer',
      'custName': 'Atharv Survase',
      'custAddress': 'Indira Nagar, Barshi. Dist - Solapur',
      'contact': '9763052443',
      'pDetails': 'watch',
      'paymentDetails': 'Cash',
      'date': '25/11/2024'
    },
    {
      'userType': 'deliveryPartner',
      'date': '25/11/2024',
      'time': '16:00',
      'priceOfProduct': 400.50,
      'paymentDetails': 'Cash',
      'acceptingReturn': true,
      'custAddress': 'Indira Nagar, Barshi. Dist - Solapur',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Generate QR Code")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              QrImageView(
                data: jsonEncode(qrDetailsList),
                version: QrVersions.auto,
                size: 200.0,
              ),
              GestureDetector(
                onTap: () async {
                  DateTime now = DateTime.now();
                  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                  setState(() {
                    qrData = "$formattedDate";
                  });
                  print(qrData);
                  Map<String, dynamic> data = {
                    "qrcode": qrData,
                  };
                },
                child: Container(
                  height: MainApp.heightCal(50),
                  width: MainApp.widthCal(400),
                  alignment: Alignment.center,
                  color: const Color.fromARGB(255, 2, 25, 44),
                  child: const Text(
                    "Generate Qr",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
