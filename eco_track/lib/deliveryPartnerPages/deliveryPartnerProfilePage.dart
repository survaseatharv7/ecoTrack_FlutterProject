import 'package:eco_track/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class Deliverypartnerprofilepage extends StatefulWidget {
  const Deliverypartnerprofilepage({super.key});

  @override
  State<Deliverypartnerprofilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Deliverypartnerprofilepage> {
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
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Icon(
                    Icons.arrow_back_ios, // Choose an icon from the Icons class
                    color: Colors.black, // Set the icon color
                    // Set the icon size
                  ),
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
            "${MainApp.deliveryPartnerProfileDetailsMap['email']}",
            style: GoogleFonts.istokWeb(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
        ],
      ),
    );
  }
}
