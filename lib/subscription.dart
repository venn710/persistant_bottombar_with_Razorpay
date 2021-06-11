import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:milk/product_schema.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';
class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  Razorpay _razorpay;
  List<bool>_isopen=[false,false,false,false];
  List<Milk>li=[
    Milk(
      desc: "Good milk",
      milktype:"Normal",
      name: "Milk",
      price: 150
    )
  ];
  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(
      StripeOptions(publishableKey: 'YOUR<<TEST KEY>')
    );
    _razorpay=new Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,paymentsuccesshandler);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,paymentfailurehandler);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,externaleventhandler);
  }
  void paymentsuccesshandler(PaymentSuccessResponse res) async
  {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.deleteAll();
      print(res.orderId);
      print(res.paymentId);
      print(res.signature);
  }
  void paymentfailurehandler(PaymentFailureResponse res1)
  {
      print(res1);
  }
  void externaleventhandler(ExternalWalletResponse res3)
  {
      print(res3);
  }
  void _pay()async
  {
    String basicAuth ='Basic ' + base64Encode(utf8.encode('YOUR<key>:YOUR<id>'));
    var url = "https://api.razorpay.com/v1/orders";
    var response=await http.post(Uri.parse(url),   
    headers: {"content-type":"application/json","authorization":basicAuth},
    body:jsonEncode({
    "amount": 100000,
    "currency": "INR",
    "receipt": "rcptid_11"
  }),
    );
print(response.body);
print(basicAuth);
var res1=await jsonDecode(response.body)['id'];
var res2=(res1.toString());
var ima='data:image/jpeg;base64,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';
    
    var options=
    {
      'key':'rzp_test_KeGXhcUJeRZoyf',
      'name':"Milk APP",
      'description':"Payment For MIlk Product",
      'order_id':res2,
      'image':ima,
      'theme':
      {
        'hide_topbar':true,
        'color':'#66f4eb',

      },
      'prefill':
      {
        'contact':'+919977665544',
        'email':'vennboddula1234@gmail.com'
      },
    };
    try
    {
      _razorpay.open(options);
    }
    catch(e)
    {
      print(e);
    }
  }
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();

  }
  @override
  Widget build(BuildContext context) {
        return SingleChildScrollView(
          child: Container(
          child: ExpansionPanelList(
            dividerColor: Colors.green,
            elevation: 16,
            expandedHeaderPadding: EdgeInsets.all(10),
          children: li.map<ExpansionPanel>((e)
          {
            return ExpansionPanel(
              canTapOnHeader: true,
              isExpanded: e.isexpand,
              headerBuilder: (context,_bool)
            {
              return Column(
                children: [
                  ListTile(
                    trailing: Text(e.price.toString()),
                    title: Text(e.name),
                    subtitle: Text(e.milktype),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: ()=>null, child: Text("SUBSCRIBE")),
                      ElevatedButton(onPressed: ()=>_pay(), child: Text("PAY")),
                    ],
                  )
                ],
              );
            }, body:Padding(
              padding: const EdgeInsets.all(0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal:20.0),
                  child: Text(e.desc,style: GoogleFonts.courgette(
                    fontSize: 18

                  ),),
                )),
            ));
          }).toList(),
          expansionCallback: (int i,bool isopen)
          {
            setState(() {
              li[i].isexpand=!isopen;
            });
          },
        ),
      ),
    );
  }
}