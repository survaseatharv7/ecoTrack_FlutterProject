import 'package:eco_track/deliveryPartnerPages/deliveryPartner_qr_scanPage.dart';
import 'package:eco_track/deliveryPartnerPages/mapInterface.dart';
import 'package:eco_track/main.dart';
import 'package:eco_track/customerPages/pages/tryOnPage.dart';
import 'package:flutter/material.dart';

class Deliverypartnerdrawerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MainApp.heightCal(70)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MainApp.widthCal(39),
                      ),
                      child: Container(
                        width: MainApp.widthCal(122),
                        height: MainApp.heightCal(57),
                        child: Image.asset(
                          'assets/ecoTrackLogo.png',
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(101), top: MainApp.heightCal(27)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'assets/ProfileCircular.png',
                  ), // Replace with your image asset path
                ),
              ),
              SizedBox(height: MainApp.heightCal(19)),
              Padding(
                padding: EdgeInsets.only(
                  left: MainApp.widthCal(23),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.only(left: MainApp.widthCal(30)),
                      child: Text(
                        '${MainApp.deliveryPartnerProfileDetailsMap['email']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(23), top: MainApp.heightCal(25)),
            child: const Text(
              'Explore',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(75, 176, 76, 1),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: MainApp.widthCal(23)),
            child: ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('QR Scan'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeliverypartnerQrScanpage()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: MainApp.widthCal(23)),
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapInterface()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: MainApp.widthCal(23)),
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change password'),
              onTap: () {
                // Handle navigation
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: MainApp.widthCal(23)),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Handle logout
              },
            ),
          ),
        ],
      ),
    );
  }
}
