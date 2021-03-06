import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:veryfi_dart/veryfi_dart.dart';
import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import '../views/receipt_details_view.dart';

class ReceiptProcessor {
  Future<dynamic> processReceipt(File image) async {
    String clientId = '';
    String clientSecret = '';
    String username = '';
    String apiKey = '';

    List<List<String>> itemList = [];

    Uint8List imageData = image.readAsBytesSync();
    String fileData = base64Encode(imageData);
    VeryfiDart client = VeryfiDart(
      clientId,
      clientSecret,
      username,
      apiKey,
    );

    Map<String, dynamic> response =
        await client.processDocument('receipt.jpg', fileData);

    String totalPayment = response['total'].toString();
    String currencyCode = response['currency_code'];
    String vendorName = response['vendor']['name'];

    for (var item in response['line_items']) {
      String description = item['description'];
      String quantity = item['quantity'].toString();
      String totalCost = item['total'].toString();

      List<String> itemInfo = [description, quantity, totalCost];
      itemList.add(itemInfo);
    }

    List<dynamic> processedDetails = [
      totalPayment,
      currencyCode,
      vendorName,
      itemList
    ];

    return processedDetails;
  }
}

Future imageDetails = getImageTextRecognition(showImage!);

Future<String> getImageTextRecognition(File image) async {
  String scannedText = '';

  try {
    if (image != null) {
      final inputImage = InputImage.fromFilePath(image.path);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);

      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      await textRecognizer.close();

      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          scannedText = scannedText + line.text + '\n';
        }
      }
    }
  } catch (e) {
    scannedText = 'Error has occurred while scanning.';
  }

  return scannedText;
}
