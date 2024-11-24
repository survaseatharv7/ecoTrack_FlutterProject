import 'package:eco_track/deliveryPartnerPages/deliveryPartner_scanQr.dart';
import 'package:eco_track/main.dart';
import 'package:eco_track/customerPages/pages/scanQr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliverypartnerQrScanpage extends StatefulWidget {
  const DeliverypartnerQrScanpage({super.key});

  @override
  State<DeliverypartnerQrScanpage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<DeliverypartnerQrScanpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(21), top: MainApp.heightCal(59)),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MainApp.widthCal(MainApp.widthCal(17))),
                  child: Container(
                    width: MainApp.widthCal(110),
                    height: MainApp.heightCal(43),
                    child: Image.asset(
                      'assets/ecoTrackLogo.png',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(119), top: MainApp.heightCal(69)),
            child: Text(
              "Scan your QR Code",
              style: GoogleFonts.roboto(
                  fontSize: 20, color: Color.fromRGBO(76, 177, 79, 1)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(33), top: MainApp.heightCal(23)),
            child: Container(
              width: MainApp.widthCal(346.28),
              height: MainApp.heightCal(372.28),
              child: Image.asset('assets/Scanner.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(93), top: MainApp.heightCal(22.72)),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeliverypartnerScanqr(userType: MainApp.userType)));

                setState(() {});
              },
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
              label: Text(
                'Scan QR Code',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(75, 176, 76, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
