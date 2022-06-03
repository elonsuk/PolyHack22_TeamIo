import 'package:flutter/material.dart';
import '../functions/payee_list.dart';
import '../classes/payee.dart';

class ProfileView extends StatelessWidget {
  ProfileView({required this.payee});
  Payee payee;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            height: 70,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(payee.profileImagePath!),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      payee.name!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      payee.contactNumber!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[300],
            ),
          ),
          onPressed: () => addPayee(payee.profileImagePath!),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
