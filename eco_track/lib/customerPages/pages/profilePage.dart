import 'package:eco_track/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  Future<void> _launchWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: MainApp.heightCal(150),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios, // Choose an icon from the Icons class
                  color: Colors.black, // Set the icon color
                  // Set the icon size
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              Text(
                "profile",
                style: GoogleFonts.istokWeb(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(45, 45, 45, 1),
                ),
              ),
            ],
          ),
          Container(
            width: 100, // Diameter of the circle
            height: 100,

            decoration: BoxDecoration(
              //color: Colors.blue, // Background color
              shape: BoxShape.circle,

              border: Border.all(
                color: const Color.fromRGBO(196, 196, 196, 1),
                width: 3,
              ),
            ),
            child: Image.asset(
              'assets/ProfileCircular.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${MainApp.userEmail}",
            style: GoogleFonts.istokWeb(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MainApp.widthCal(34.13),
                ),
                child: Container(
                  width: MainApp.widthCal(80.11),
                  height: MainApp.heightCal(77.83),
                  child: Image.asset(
                    'star1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  height: 75,
                  width: 2,
                  color: Color.fromRGBO(151, 151, 151, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: MainApp.widthCal(34)),
                child: Column(
                  children: [
                    Text(
                      "${MainApp.profileDetialsMap['points']}",
                      style: GoogleFonts.istokWeb(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Total Points",
                      style: GoogleFonts.istokWeb(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  height: 75,
                  width: 2,
                  color: Color.fromRGBO(151, 151, 151, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: MainApp.widthCal(34)),
                child: Column(
                  children: [
                    Text(
                      "${MainApp.profileDetialsMap['returns']}",
                      style: GoogleFonts.istokWeb(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Returns",
                      style: GoogleFonts.istokWeb(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Container(
                  height: 86.32,
                  width: 90.07,
                  child: Image.asset(
                    'assets/star.png',
                  ),
                ),
              ),
            ],
          ),
          Text("LEVEL UP !",
              style: GoogleFonts.jomhuria(
                fontSize: 40,
              )),
          Text("Win",
              style: GoogleFonts.jomhuria(
                fontSize: 40,
              )),
          Text("CASHBACKS!!",
              style: GoogleFonts.jomhuria(
                fontSize: 40,
              )),
          GestureDetector(
            onTap: () async {
              await _launchWebsite(
                  'https://www.amazon.in/?&tag=googhydrabk1-21&ref=pd_sl_8ajnwscezy_e&adgrpid=155259813353&hvpone=&hvptwo=&hvadid=674893539992&hvpos=&hvnetw=g&hvrand=1588771453032312516&hvqmt=e&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1007788&hvtargid=kwd-298301461664&hydadcr=5625_2359479&gad_source=1');
              setState(() {});
            },
            child: Container(
                alignment: Alignment.center,
                height: 57,
                width: 226,
                decoration: BoxDecoration(
                  color:
                      const Color.fromRGBO(75, 176, 76, 1), // Background color
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text("AMAZON.com",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(254, 248, 248, 1),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 9),
            child: Expanded(
              child: Container(
                  child: Text(
                      "200 points shop with amazon whatever you like and win Money cashbacks")),
            ),
          ),
        ],
      ),
    );
  }
}
