import 'package:flutter/gestures.dart';
import 'package:footer/profile.dart';
import 'package:footer/record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/scan.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Footer extends StatefulWidget {

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  int currentTab = 0;

  final List<Widget> screens = [
    ProfilePage(),
    RecordPage(),
    ScanPage(d: '')
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ProfilePage();

  String _data = "";

  _scan() {
    FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.document_scanner),
        onPressed: (){
          _scan();
          //Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage(d: _data)));
        },
        backgroundColor: Color(0xff14A793),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = RecordPage();
                        currentTab = 1;
                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.event_note,
                            color: currentTab == 1 ? Color(0xff14A793) : Colors.grey
                        ),
                        Text('Historial',
                          style: TextStyle(color: currentTab == 1 ? Color(0xff14A793) : Colors.grey
                          ),

                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 48),
                  ),

                  /*
                  MaterialButton(
                    //minWidth: 40,
                    onPressed: () {  },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                        ),
                        Text('Escáner',
                          style: TextStyle(color: currentTab == 1 ? Color(0xff14A793) : Colors.grey
                          ),

                        )
                      ],
                    ),
                  ),

                   */

                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Escáner',
                            style: TextStyle(
                              color: currentTab == 2 ? Color(0xff14A793) : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  currentScreen = ScanPage(d: _data);
                                  currentTab = 2;
                                });
                                print('Login Text Clicked');
                              }),
                      ]),
                    ),
                  ),

                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(top: 25),
                  //     ),
                  //     Text('Escáner',
                  //       style: TextStyle(color: Colors.grey,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //
                  //     )
                  //   ],
                  // ),


                  Padding(
                    padding: EdgeInsets.only(left: 42),
                  ),

                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 0;
                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.person,
                            color: currentTab == 0 ? Color(0xff14A793) : Colors.grey
                        ),
                        Text('Perfil',
                          style: TextStyle(color: currentTab == 0 ? Color(0xff14A793) : Colors.grey
                          ),

                        )
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
