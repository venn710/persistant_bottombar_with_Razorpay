import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class Payment extends StatelessWidget {
  Razorpay razorpay;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Cards",style: GoogleFonts.alata (
            fontSize: 20
          ),),
        ),
        ListTile(
          leading: Icon(
            Icons.credit_card,
            size:35,
          ),
          title: Text("Credit,Debit & ATM Cards",style: GoogleFonts.alegreya(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
          trailing: Icon(Icons.arrow_right_sharp,
          size: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("UPI",style: GoogleFonts.alata(
            fontSize: 20
          )),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.amazonPay,
          size: 30,
          color: Colors.amber,
          ),
          title:Text("Amazon Pay",style: GoogleFonts.alegreya(
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.googlePay,
          size:30,
          color: Colors.blue,
          ),
          title: Text("Google Pay",style: GoogleFonts.alegreya(
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),),
        )
      ],
    );
  }
}