import 'package:eco_track/deliveryPartnerPages/deliveryBoardingPage.dart';
import 'package:eco_track/main.dart';
import 'package:eco_track/customerPages/pages/boardingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSelector extends StatefulWidget {
  const UserSelector({super.key});

  @override
  State<UserSelector> createState() => _UserSelectorState();
}

class _UserSelectorState extends State<UserSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(134), top: MainApp.heightCal(171)),
            child: Container(
                width: MainApp.widthCal(158),
                height: MainApp.heightCal(72),
                child: Image.asset(
                  'assets/ecoTrackLogo.png',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(111), top: MainApp.heightCal(127)),
            child: Container(
                width: MainApp.widthCal(190),
                height: MainApp.heightCal(48),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Boardingpage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(75, 176, 75, 1), // Background color
                      // Text color
                      elevation: 5, // Shadow elevation
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                    child: Text("Customer",
                        style: GoogleFonts.metrophobic(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)))),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(111), top: MainApp.heightCal(64)),
            child: Container(
                width: MainApp.widthCal(190),
                height: MainApp.heightCal(48),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DeliveryPartnerBoardingpage()));
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(75, 176, 75, 1), // Background color
                      // Text color
                      elevation: 5, // Shadow elevation
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                    child: Text("Delivery Partner",
                        style: GoogleFonts.metrophobic(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)))),
          )
        ],
      ),
    );
  }
}
