import 'package:eco_track/deliveryPartnerPages/deliveryLoginPage.dart';
import 'package:eco_track/deliveryPartnerPages/deliverySignupPage.dart';
import 'package:eco_track/main.dart';
import 'package:eco_track/customerPages/pages/loginPage.dart';
import 'package:eco_track/customerPages/pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPartnerBoardingpage extends StatefulWidget {
  const DeliveryPartnerBoardingpage({super.key});

  @override
  State<DeliveryPartnerBoardingpage> createState() => _BoardingpageState();
}

class _BoardingpageState extends State<DeliveryPartnerBoardingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(19), top: MainApp.heightCal(82)),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MainApp.widthCal(MainApp.widthCal(105))),
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
                left: MainApp.widthCal(49), top: MainApp.heightCal(62)),
            child: Text(
              "Hello ,",
              style: GoogleFonts.notoSansJavanese(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(49), top: MainApp.heightCal(10)),
            child: Row(
              children: [
                Text(
                  "welcome to ",
                  style: GoogleFonts.notoSansJavanese(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  "EcoTrack",
                  style: GoogleFonts.jacquesFrancois(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 122, 53, 1)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(94), top: MainApp.heightCal(80)),
            child: Container(
              width: MainApp.widthCal(222),
              height: MainApp.heightCal(48),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryPartnerSignuppage()));
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
                  child: Text("SIGN UP",
                      style: GoogleFonts.metrophobic(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(94), top: MainApp.heightCal(69)),
            child: Container(
              width: MainApp.widthCal(222),
              height: MainApp.heightCal(48),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryPartnerLoginpage()));
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
                  child: Text("LOGIN",
                      style: GoogleFonts.metrophobic(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(103), top: MainApp.heightCal(88)),
            child: Text(
              "Or Sign up with social account",
              style: GoogleFonts.metrophobic(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(34, 34, 34, 1)),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(139.31), top: MainApp.heightCal(52)),
                child: Container(
                  width: MainApp.widthCal(52),
                  height: MainApp.heightCal(35),
                  child: Image.asset(
                    'assets/googleLogo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(21.69), top: MainApp.heightCal(52)),
                child: Container(
                  width: MainApp.widthCal(52),
                  height: MainApp.heightCal(35),
                  child: Image.asset(
                    'assets/facebook.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
