import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_track/main.dart';
import 'package:eco_track/customerPages/pages/qr_scan_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Packagereturnpage extends StatefulWidget {
  const Packagereturnpage({super.key});

  @override
  State<Packagereturnpage> createState() => _PackagereturnpageState();
}

class _PackagereturnpageState extends State<Packagereturnpage> {
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
                  onPressed: () {},
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
                left: MainApp.widthCal(41), top: MainApp.heightCal(37)),
            child: Container(
              width: MainApp.widthCal(340),
              height: MainApp.heightCal(40),
              alignment: Alignment.center,
              child: Text(
                "Return the package Material",
                style: GoogleFonts.jomhuria(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(129), top: MainApp.heightCal(10)),
            child: Container(
              width: MainApp.widthCal(215),
              height: MainApp.heightCal(20),
              alignment: Alignment.center,
              child: Text(
                "Win points and exciting cashbacks",
                style: GoogleFonts.istokWeb(
                    color: Color.fromRGBO(45, 45, 45, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(63), top: MainApp.heightCal(112)),
            child: Container(
              width: MainApp.widthCal(209),
              height: MainApp.heightCal(20),
              alignment: Alignment.center,
              child: Text(
                "Return the package material now",
                style: GoogleFonts.istokWeb(
                    color: Color.fromRGBO(45, 45, 45, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(63), top: MainApp.heightCal(31)),
            child: Container(
              width: MainApp.widthCal(226),
              height: MainApp.heightCal(57),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _ReturnNowPage()));
                  setState(() {});
                },
                child: Text(
                  'Continue',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(75, 176, 76, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(63), top: MainApp.heightCal(74)),
            child: Container(
              width: MainApp.widthCal(314),
              height: MainApp.heightCal(20),
              alignment: Alignment.center,
              child: Text(
                "Return the package material on Next Delivery",
                style: GoogleFonts.istokWeb(
                    color: Color.fromRGBO(45, 45, 45, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(63), top: MainApp.heightCal(31)),
            child: Container(
              width: MainApp.widthCal(226),
              height: MainApp.heightCal(57),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Return to Home',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(75, 176, 76, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReturnNowPage extends StatefulWidget {
  const _ReturnNowPage({super.key});

  @override
  State<_ReturnNowPage> createState() => _ReturnNowPageState();
}

class _ReturnNowPageState extends State<_ReturnNowPage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool isCameraEnabled = false;

  Future<void> _openCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Get the image file path
      });
    }
  }

  String? filePath;
  bool isFileSelected = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filePath = result.files.single.path; // Get the file path
      });
    } else {
      // User canceled the picker
      setState(() {
        filePath = 'No file selected';
      });
    }
  }

  Widget cameraOrFileDisplayer() {
    if (isFileSelected) {
      return filePath == null
          ? Text('No image selected')
          : Image.asset(filePath!);
    } else if (isCameraEnabled) {
      return _imageFile == null
          ? Text("No image selected")
          : Image.file(_imageFile!);
    } else {
      return Text("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(
              left: MainApp.widthCal(21), top: MainApp.heightCal(59)),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
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
              left: MainApp.widthCal(35), top: MainApp.heightCal(37)),
          child: Container(
            width: MainApp.widthCal(340),
            height: MainApp.heightCal(40),
            alignment: Alignment.center,
            child: Text(
              "Return the package Material",
              style: GoogleFonts.jomhuria(fontSize: 40, color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MainApp.widthCal(30), top: MainApp.heightCal(10)),
          child: Container(
            width: MainApp.widthCal(377),
            height: MainApp.heightCal(20),
            alignment: Alignment.center,
            child: Text(
              "Upload a photo that you have return the packaging material",
              style: GoogleFonts.istokWeb(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        if (isCameraEnabled || isFileSelected)
          Padding(
            padding: EdgeInsets.only(
                left: MainApp.widthCal(82), top: MainApp.heightCal(49)),
            child: Container(
              width: MainApp.widthCal(200),
              height: MainApp.heightCal(200),
              child: cameraOrFileDisplayer(),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
              left: MainApp.widthCal(82), top: MainApp.heightCal(49)),
          child: Container(
            width: MainApp.widthCal(226),
            height: MainApp.heightCal(57),
            child: ElevatedButton(
              onPressed: () {
                _openCamera();
                isCameraEnabled = true;
                isFileSelected = false;
              },
              child: Text(
                'Upload the photo',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(75, 176, 76, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MainApp.widthCal(82), top: MainApp.heightCal(30)),
          child: Container(
            width: MainApp.widthCal(226),
            height: MainApp.heightCal(57),
            child: ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                MainApp.profileDetialsMap['points'] += 5;
                MainApp.profileDetialsMap['returns']++;
                await FirebaseFirestore.instance
                    .collection('UserInfo')
                    .doc(MainApp.profileDetialsMap['email'])
                    .set(MainApp.profileDetialsMap);
                setState(() {});
              },
              child: Text(
                'Submit',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(75, 176, 76, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
