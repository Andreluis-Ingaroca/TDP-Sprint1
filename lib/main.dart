import 'package:flutter/material.dart';
import 'package:login_jwt/view/scanPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_jwt/view/loginPage.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Nodejs Mongodb',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  // Widget buildNavigateButton() => FloatingActionButton(
  //   child: Icon(Icons.document_scanner),
  //   backgroundColor: Colors.green,
  //   shape: CircleBorder(),
  //   onPressed: () {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage()));
  //   },
  // );

  String _data = "";

  _scan() {
    FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE)
    .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Nodejs with Flutter using MongoDB", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                sharedPreferences.clear();
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
              },
              child: Text("Logout", style: TextStyle(color: Colors.white),)
          )
        ],

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          // IconButton(
          //   onPressed: () => _scan(),
          //   icon: Icon(Icons.document_scanner),
          // ),

          // FlatButton.icon(
          //   onPressed: () => _scan(),
          //   icon: Icon(Icons.document_scanner),
          //   label: Text(""),
          //   //child: Text('hola'),
          // ),

          Text(_data),
        ],
      ),
      
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Nodejs"), 
                accountEmail: new Text("codigoalphaco@gmail.com"),
            ),
            new ListTile(title: new Text("List Products"),
              trailing: new Icon(Icons.list),
              onTap: (){},
            ),
            new ListTile(title: new Text("Add Products"),
              trailing: new Icon(Icons.add),
              onTap: (){},
            ),
            new ListTile(title: new Text("Register user"),
              trailing: new Icon(Icons.add),
              onTap: (){},
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scan();
          Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage(da: _data)));
        },
        child: Icon(Icons.document_scanner),
        backgroundColor: Colors.green,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );

  }
}

