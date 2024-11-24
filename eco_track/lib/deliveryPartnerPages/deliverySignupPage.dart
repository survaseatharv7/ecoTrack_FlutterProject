import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_track/deliveryPartnerPages/deliveryLoginPage.dart';
import 'package:eco_track/main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPartnerSignuppage extends StatefulWidget {
  const DeliveryPartnerSignuppage({super.key});

  @override
  State<DeliveryPartnerSignuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<DeliveryPartnerSignuppage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
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
                child: Text("Sign up",
                    style: GoogleFonts.metrophobic(
                        color: Color.fromRGBO(75, 176, 75, 1),
                        fontSize: 34,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(33), top: MainApp.heightCal(57)),
                child: Container(
                    height: MainApp.heightCal(64),
                    width: MainApp.widthCal(343),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          label: Text("Name"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1)))),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(33), top: MainApp.heightCal(8)),
                child: Container(
                    height: MainApp.heightCal(64),
                    width: MainApp.widthCal(343),
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
                    left: MainApp.widthCal(33), top: MainApp.heightCal(8)),
                child: Container(
                    height: MainApp.heightCal(64),
                    width: MainApp.widthCal(343),
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
                    left: MainApp.widthCal(95), top: MainApp.heightCal(28)),
                child: Container(
                  width: MainApp.widthCal(222),
                  height: MainApp.heightCal(48),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_emailController.text.trim().isNotEmpty &&
                            _nameController.text.trim().isNotEmpty &&
                            _passwordController.text.trim().isNotEmpty) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text
                                        .toLowerCase()
                                        .trim(),
                                    password: _passwordController.text.trim());

                            Map<String, dynamic> map = {};
                            map['email'] = _emailController.text.trim();
                            map['name'] = _nameController.text.trim();
                            map['password'] = _passwordController.text.trim();
                            map['userType'] = 'deliveryPartner';

                            await FirebaseFirestore.instance
                                .collection('DeliveryPartnerInfo')
                                .doc(_emailController.text.trim())
                                .set(map);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeliveryPartnerLoginpage()));
                          } on FirebaseAuthException catch (e) {
                            print(e.message);
                          }
                        } else {
                          print("Fill all fields");
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
                      child: Text("SIGN UP",
                          style: GoogleFonts.metrophobic(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MainApp.widthCal(176), top: MainApp.heightCal(36)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryPartnerLoginpage()));
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Text('Already have an account?'),
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
