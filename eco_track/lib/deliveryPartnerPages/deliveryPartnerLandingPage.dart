import 'package:eco_track/deliveryPartnerPages/deliveryPartnerDrawerPage.dart';
import 'package:eco_track/deliveryPartnerPages/deliveryPartnerProfilePage.dart';
import 'package:eco_track/deliveryPartnerPages/deliveryPartner_qr_scanPage.dart';
import 'package:eco_track/deliveryPartnerPages/mapInterface.dart';
import 'package:eco_track/main.dart';
import 'package:eco_track/customerPages/pages/drawerPage.dart';
import 'package:eco_track/customerPages/pages/profilePage.dart';
import 'package:eco_track/customerPages/pages/tryOnPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliverypartnerNavBarController extends StatefulWidget {
  const DeliverypartnerNavBarController({super.key});

  @override
  State<DeliverypartnerNavBarController> createState() =>
      _NavBarControllerState();
}

class _NavBarControllerState extends State<DeliverypartnerNavBarController> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Deliverypartnerlandingpage(),
    MapInterface(),
    const Deliverypartnerprofilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(230, 240, 230, 1),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.location_on, 'Map', 1),
            _buildNavItem(Icons.person, 'Profile', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 20 : 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(51, 122, 53, 1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Deliverypartnerlandingpage extends StatefulWidget {
  @override
  State<Deliverypartnerlandingpage> createState() => _LandingPageState();
}

class _LandingPageState extends State<Deliverypartnerlandingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        surfaceTintColor: Color.fromRGBO(255, 255, 255, 1),
        shadowColor: Color.fromRGBO(255, 255, 255, 1),
        /*leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Navigator.push(context,
            //    MaterialPageRoute(builder: (context) => CustomDrawer()));
            setState(() {});
          },
        ),*/
        title: Row(
          children: [
            Container(
              width: MainApp.widthCal(65),
              height: MainApp.heightCal(27),
              child: Image.asset(
                'assets/ecoTrackLogo.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
            SizedBox(
              width: MainApp.widthCal(10),
            ),
            Container(
              width: MainApp.widthCal(165),
              height: MainApp.heightCal(24.05),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(217, 217, 217, 1), // Shadow color
                    spreadRadius: 5, // How much the shadow spreads
                    blurRadius: 5, // Softening the shadow
                    offset: Offset(0, 0), // Position of shadow (x, y)
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  ),
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  hintText: "Search Here",
                  hintStyle: GoogleFonts.inriaSans(
                      color: Color.fromRGBO(96, 96, 96, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
              width: MainApp.widthCal(35),
              height: MainApp.heightCal(35),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/ProfileCircular.png',
                fit: BoxFit.cover,
              )), // Replace with user profile picture URL

          SizedBox(width: 16),
        ],
      ),
      drawer: Deliverypartnerdrawerpage(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(20)),
              child: Container(
                width: MainApp.widthCal(350),
                height: MainApp.heightCal(337),
                child: Image.asset(
                  'assets/scanMeImage.jpeg', // Replace with the QR scan image asset
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(20)),
              child: Container(
                width: MainApp.widthCal(400),
                height: MainApp.heightCal(26),
                child: Text(
                  'Scan the QR code to get all the details of the product ordered',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.istokWeb(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(91)),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeliverypartnerQrScanpage()));
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
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(20)),
              child: Container(
                width: MainApp.widthCal(350),
                height: MainApp.heightCal(337),
                child: Image.asset(
                  'assets/returnCashbackImage.jpeg', // Replace with the QR scan image asset
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(20)),
              child: Container(
                width: MainApp.widthCal(400),
                height: MainApp.heightCal(100),
                child: Text(
                  'Return the package material, the cardboard box, Bioplastics, Paper and card, Tertiary packaging materials, Wood, Corrugated cardboard and the material which can be reused. If you return it, you can win points and get cashbacks.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.istokWeb(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(122)),
              child: ElevatedButton(
                onPressed: () {
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Packagereturnpage()));
                  setState(() {});*/
                },
                child: Text(
                  'Return Material',
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
            SizedBox(height: 20),
            /* Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(20)),
              child: Container(
                width: MainApp.widthCal(350),
                height: MainApp.heightCal(337),
                child: Image.asset(
                  'assets/virtualTryOnImage.jpeg', // Replace with the QR scan image asset
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(20)),
              child: Container(
                width: MainApp.widthCal(400),
                height: MainApp.heightCal(100),
                child: Text(
                  'With Virtual Try on, you can try the dress, accessories, glasses on your phone and can get better products and great satisfaction. It will save time  and also reduce product returning.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.istokWeb(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: MainApp.widthCal(160)),
              child: ElevatedButton(
                onPressed: () {
                  // Handle QR code scan action
                },
                child: Text(
                  'Try On',
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
            ),*/
            SizedBox(
              height: MainApp.heightCal(20),
            )
          ],
        ),
      ),
    );
  }
}
