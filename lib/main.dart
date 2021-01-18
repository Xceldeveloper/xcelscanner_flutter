import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:xcelscanner_flutter/barcodescanner.dart';
import 'package:xcelscanner_flutter/qrcodescanner.dart';
import 'package:xcelscanner_flutter/colorpicker.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color:Colors.black,
          child: Center(
            child: Text("XcelScanner",style: TextStyle(color: Colors.white,fontSize: 35),)
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FabCircularMenu(
            key: fabKey,
            // Cannot be `Alignment.center`
            alignment: Alignment.bottomRight,
            ringColor: Colors.white.withAlpha(25),
            ringDiameter: 500.0,
            ringWidth: 150.0,
            fabSize: 70.0,
            fabElevation: 8.0,
            fabIconBorder: CircleBorder(),
            // Also can use specific color based on wether
            // the menu is open or not:
            // fabOpenColor: Colors.white
            // fabCloseColor: Colors.white
            // These properties take precedence over fabColor
            fabColor: Colors.green,
            fabOpenIcon: Icon(Icons.menu, color: Colors.black),
            fabCloseIcon: Icon(Icons.close, color: Colors.black),
            fabMargin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            onDisplayChange: (isOpen) {

            },
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ColorPickerPage()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(MdiIcons.eyedropperVariant, color: Colors.green,size: 40,),
              ),
              RawMaterialButton(
                onPressed: () {

                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.picture_as_pdf_outlined, color: Colors.green,size: 37,),
              ),

              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => BarCodeScannerPage()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(MdiIcons.barcodeScan, color: Colors.green,size: 37,),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => QrcodeScannerPage()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(MdiIcons.qrcodeScan, color: Colors.green,size: 37,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }
}
