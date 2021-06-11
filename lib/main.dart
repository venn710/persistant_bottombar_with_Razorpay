import 'package:flutter/material.dart';
import 'package:milk/Homepage.dart';
import 'package:milk/tabnavigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Persistant navbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currindex=0;
  String _currpage="page1";
  List<String>pagekeys=["page1","page2"];
  Map<String,GlobalKey<NavigatorState>>_navigatorkeys={
    "page1":GlobalKey<NavigatorState>(),
    "page2":GlobalKey<NavigatorState>(),
  };
  Widget _buildoffsetNavigator(String st)
  {
    return Offstage(
      offstage: _currpage!=st,
      child: TabNavigator(
        navigatorKey: _navigatorkeys[st],
        page: st,),
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () async
          {
           final isfirstroute=! await _navigatorkeys[_currpage].currentState.maybePop();
           if(isfirstroute)
           {
             if(_currpage!="page1")
             {
               setState(() {
                 _currindex=0;
                 _currpage="page1";
               });
               return false;
             }
           }
           return isfirstroute;
          },
          child: Scaffold(
          body: Stack(
            children:
            [
            _buildoffsetNavigator("page1"),
            _buildoffsetNavigator("page2"),
            ]

          ),
        bottomNavigationBar: 
        BottomNavigationBar(
          onTap: (ind)
          {
            setState(() {
            _currindex=ind;
            _currpage=pagekeys[ind];
            });
          },
          currentIndex:_currindex,
          selectedItemColor: Colors.red,
          items: 
[      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:'Home' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp),
          label: 'MY Account'
        ),
]
        ),
        appBar: AppBar(
        title: Text(widget.title),
        ),
      ),
    );
  }
}
