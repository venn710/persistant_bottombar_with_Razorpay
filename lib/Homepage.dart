import 'package:flutter/material.dart';
import 'package:milk/milk_center_schema.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MilkCenter>mlkcnts=[];
  bool _busy=true;
  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/delivery.gif")
              )
            ),
          ),
          Text("Your Nearby Areas Are"),
        ],
      ),
    );
  }
}