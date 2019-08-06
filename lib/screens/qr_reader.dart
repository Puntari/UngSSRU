import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class Qrcode extends StatefulWidget {
  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
// Explicit
 String qrCodeString ='QRcode';


// Method

  Widget showText() {
    return Container(alignment: Alignment.center,
     child: Text(
       '$qrCodeString',
       style: TextStyle(fontSize: 50.0),
       ),
    );
  }

  Widget showButtom() {
    return RaisedButton.icon(
      icon: Icon(Icons.android),
      label: Text('Read QR code'),
      onPressed: () {
        qrProcess();
      },
    );
  }

  Future<void> qrProcess ()async{

    try {
      String codeString = await BarcodeScanner.scan();

      if (codeString.length !=0) {
        setState(() {
         qrCodeString = codeString;
        });
        
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showText(),
          showButtom(),
        ],
      ),
    );
  }
}
