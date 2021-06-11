import 'package:flutter/material.dart';
import 'package:milk/payments.dart';
import 'package:milk/settings.dart';
import 'package:milk/subscription.dart';

class Myaccount extends StatefulWidget {
  @override
  _MyaccountState createState() => _MyaccountState();
}

class _MyaccountState extends State<Myaccount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  Text("Email"),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: CircleAvatar(
                  child: Text("V"),
                )),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child:GestureDetector(
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>Subscription())),
              child: IconBuilder(icon: Icon(Icons.assistant_outlined),label: "Subscribe",))),
            Expanded(child:GestureDetector(
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)
              {
                return Settings();
              })),
              child: IconBuilder(icon: Icon(Icons.settings),label: "Settings",))),
            Expanded(
              child: GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return Payment();
                })),
                child:IconBuilder(icon: Icon(Icons.account_balance_wallet_sharp),label: "Payments",),
              ),
            ),
          ],
        )
      ],
    );
  }
}
class IconBuilder extends StatelessWidget {
  IconBuilder({this.icon,this.label});
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(label)
      ],
    );
  }
}
