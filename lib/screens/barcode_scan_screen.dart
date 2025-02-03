import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

class BarcodeScanScreen extends StatefulWidget {
  const BarcodeScanScreen({super.key});

  @override
  State<BarcodeScanScreen> createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen> {
  String barcode = "";

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        barcode = result.rawContent;
      });
    } catch (e) {
      setState(() {
        barcode = "Failed to get barcode: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text("Scan Barcode"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              barcode.isEmpty ? "Scan a code" : "Scanned code: $barcode",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
