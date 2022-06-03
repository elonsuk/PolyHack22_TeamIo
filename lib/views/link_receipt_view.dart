import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:group_payment/functions/process_receipt.dart';
import 'package:group_payment/views/command_view.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'receipt_details_view.dart';
import '../widgets/link_receipt_button.dart';
import '../widgets/verify_payment_button.dart';

class LinkReceiptView extends StatefulWidget {
  const LinkReceiptView({Key? key}) : super(key: key);

  @override
  State<LinkReceiptView> createState() => _LinkReceiptViewState();
}

class _LinkReceiptViewState extends State<LinkReceiptView> {
  bool imageProcessing = false;

  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    }

    setState(() => showImage = File(image.path));
  }

  Future getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    setState(() => showImage = File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: showImage == null
                    ? Text("Take/Load Receipt Photo")
                    : Visibility(
                        visible: !imageProcessing,
                        child: ListView(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(showImage!),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            LinkReceiptButton(
                              buttonOneIcon: Icons.check,
                              onPressedFuncOne: () {
                                setState(() {
                                  imageProcessing = true;
                                });
                              },
                              showButtonTwo: true,
                              buttonTwoIcon: Icons.clear,
                              onPressedFuncTwo: () {
                                setState(() => showImage = null);
                              },
                            ),
                          ],
                          scrollDirection: Axis.vertical,
                        ),
                        replacement: ListView(
                          children: [
                            ReceiptDetailsView(),
                            Spacer(),
                            LinkReceiptButton(
                              buttonOneIcon: Icons.check,
                              onPressedFuncOne: () {
                                paymentLinkComplete = true;
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            CommandView(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              showButtonTwo: true,
                              buttonTwoIcon: Icons.replay,
                              onPressedFuncTwo: () {
                                setState(() {
                                  imageProcessing = false;
                                  showImage = null;
                                });
                              },
                            ),
                          ],
                          scrollDirection: Axis.vertical,
                        ),
                      ),
              ),
            ),
            VerifyPaymentButton(
              buttonOneIcon: Icons.camera_alt,
              onPressedFuncOne: () => getImageFromCamera(),
              showButtonTwo: true,
              buttonTwoIcon: Icons.insert_photo,
              onPressedFuncTwo: () => getImageFromGallery(),
            ),
          ],
        ),
      ),
    );
  }
}
