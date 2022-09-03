import 'package:flutter/gestures.dart';
import 'package:footer/profile.dart';
import 'package:footer/record.dart';
import 'package:flutter/material.dart';
import 'package:footer/camera.dart';
import 'package:sizer/sizer.dart';

class Footer extends StatefulWidget {

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  int currentTab = 0;

  final List<Widget> screens = [
    ProfilePage(),
    RecordPage(),
    CameraPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ProfilePage();

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(

            body: PageStorage(
              child: currentScreen,
              bucket: bucket,
            ),

            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_a_photo),
              onPressed: () {

                setState((){
                  currentScreen = CameraPage();
                  currentTab = 2;
                });
                //opciones(context);
                //_scan();
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage(d: _data)));
              },
              backgroundColor: Color(0xff14A793),
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 1.h,
              child: Container(
                height: 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                        ),

                        MaterialButton(
                          minWidth: 8.w,
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
                                style: TextStyle(color: currentTab == 1 ? Color(0xff14A793) : Colors.grey,
                                    fontSize: 12.sp, fontWeight: currentTab == 1 ? FontWeight.bold : FontWeight.normal),

                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 9.w),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Cámara',
                                  style: TextStyle(
                                    color: currentTab == 2 ? Color(0xff14A793) : Colors.grey,
                                      fontSize: 12.sp, fontWeight: currentTab == 2 ? FontWeight.bold : FontWeight.normal
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        //currentScreen = ScanPage();
                                        currentTab = 2;
                                      });
                                      print('Login Text Clicked');
                                    }),
                            ]),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 11.w),
                        ),

                        MaterialButton(
                          minWidth: 8.w,
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
                                style: TextStyle(color: currentTab == 0 ? Color(0xff14A793) : Colors.grey,
                                    fontSize: 12.sp, fontWeight: currentTab == 0 ? FontWeight.bold : FontWeight.normal
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
    );
  }
}