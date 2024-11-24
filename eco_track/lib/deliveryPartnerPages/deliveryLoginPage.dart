import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_track/deliveryPartnerPages/deliveryPartnerLandingPage.dart';
import 'package:eco_track/main.dart';
import 'package:eco_track/customerPages/pages/landingPage.dart';
import 'package:eco_track/customerPages/pages/signupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPartnerLoginpage extends StatefulWidget {
  const DeliveryPartnerLoginpage({super.key});

  @override
  State<DeliveryPartnerLoginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<DeliveryPartnerLoginpage> {
  bool isChecked = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(19), top: MainApp.heightCal(82)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                      ),
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
                    left: MainApp.widthCal(49), top: MainApp.heightCal(67)),
                child: Text("Login",
                    style: GoogleFonts.metrophobic(
                        color: Color.fromRGBO(75, 176, 75, 1),
                        fontSize: 34,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(25), top: MainApp.heightCal(65)),
                child: Container(
                    height: MainApp.heightCal(64),
                    width: MainApp.widthCal(365),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1)))),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(25), top: MainApp.heightCal(8)),
                child: Container(
                    height: MainApp.heightCal(64),
                    width: MainApp.widthCal(365),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1)))),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(202), top: MainApp.heightCal(28)),
                child: Row(
                  children: [
                    Text('Forgot your password?'),
                    SizedBox(
                      width: MainApp.widthCal(4),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color.fromRGBO(219, 48, 34, 1),
                      size: 24,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(40), top: MainApp.heightCal(39)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        isChecked = !isChecked;
                        setState(() {});
                      },
                      child: Container(
                        height: MainApp.heightCal(22),
                        width: MainApp.widthCal(20),
                        color: Color.fromRGBO(217, 217, 217, 1),
                        child: isChecked
                            ? const Icon(
                                Icons.done,
                                color: Color.fromRGBO(75, 176, 75, 1),
                              )
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: MainApp.widthCal(14),
                    ),
                    Text(
                      'Remember me',
                      style: GoogleFonts.notoSansJavanese(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(95), top: MainApp.heightCal(28)),
                child: Container(
                  width: MainApp.widthCal(222),
                  height: MainApp.heightCal(48),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_emailController.text.trim().isNotEmpty &&
                            _passwordController.text.trim().isNotEmpty) {
                          try {
                            UserCredential _userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim());
                            print("Login Successful");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeliverypartnerNavBarController()));

                            DocumentSnapshot _docSnap = await FirebaseFirestore
                                .instance
                                .collection('DeliveryPartnerInfo')
                                .doc(_emailController.text.trim())
                                .get();

                            Map<String, dynamic> map = {};
                            map['name'] = _docSnap.get('name');
                            map['email'] = _docSnap.get('email');
                            map['password'] = _docSnap.get('password');
                            map['userType'] = _docSnap.get('userType');
                            MainApp.deliveryPartnerProfileDetailsMap = map;
                            MainApp.deliveryPartnerEmail = map['email'];
                            MainApp.deliveryPartnerUserName = map['name'];
                            MainApp.deliveryPartnerPassword = map['password'];
                            MainApp.userType = map['userType'];
                          } catch (e) {
                            print("Error");
                          }
                        } else {
                          print("Fill details in all fields");
                        }
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
                    left: MainApp.widthCal(104), top: MainApp.heightCal(63)),
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
                        left: MainApp.widthCal(139.31),
                        top: MainApp.heightCal(52)),
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
                        left: MainApp.widthCal(21.69),
                        top: MainApp.heightCal(52)),
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
        ),
      ),
    );
  }
}
