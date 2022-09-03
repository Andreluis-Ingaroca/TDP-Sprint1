import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {

  List<Entry> entries = [
    Entry(date: "27-05-2022 10:20:35"),
    Entry(date: "28-05-2022 10:20:35"),
    Entry(date: "29-05-2022 10:20:35"),
    Entry(date: "30-05-2022 10:20:35"),
  ];

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Volver'),
              backgroundColor: Color(0xff14A793),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.chevron_left_outlined),
              ),
            ),

            body: Container(
              child: SingleChildScrollView(
                //physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 4.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 85.w,
                      margin: EdgeInsets.all(1.h),
                      padding: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff9FA5C0)),
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Historial de Alertas',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Ingresos sin cumplir Protocolos',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                    ),

                    Container(
                        width: 85.w,
                        margin: EdgeInsets.all(1.h),
                        padding: EdgeInsets.all(2.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff9FA5C0)),
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: entries.map((user){
                            final count = entries.indexOf(user) + 1;
                            return Container(
                              child: ListTile(
                                title: Text(count.toString() + '° Ingreso', style: TextStyle(color: Color(0xff2E3E5C), fontWeight: FontWeight.bold, fontSize: 11.sp)),
                                subtitle: Text(user.date, style: TextStyle(color: Color(0xff2E3E5C), fontSize: 10.sp)),
                              ),
                              //margin: EdgeInsets.all(5),
                              //padding: EdgeInsets.all(5),
                            );
                          }).toList(),
                        )
                    ),

                    // Card(
                    //     margin: EdgeInsets.only(top: 25),
                    //     color: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(color: Color(0xff9FA5C0)),
                    //       borderRadius: BorderRadius.circular(45),
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(top: 25, left: 50, right: 50, bottom: 25),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: const <Widget>[
                    //
                    //           Text('1º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text('27-05-2022 (10:20:35)'),
                    //
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //
                    //           Text('2º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text('27-05-2022 (10:20:35)'),
                    //
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //
                    //           Text('3º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text('27-05-2022 (10:20:35)'),
                    //
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //
                    //           Text('4º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text('27-05-2022 (10:20:35)'),
                    //
                    //           SizedBox(
                    //             height: 10,
                    //           ),
                    //
                    //           Text('5º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text('27-05-2022 (10:20:35)'),
                    //
                    //         ],
                    //       ),
                    //     )
                    // ),

                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(2.h),
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.red),
                      ),
                      onPressed: () { },
                      child: Text('Ingreso ${entries.length} veces', style: TextStyle( color: Colors.red, fontSize: 15.sp)),
                    ),

                  ],
                ),
              ),
            ),

      );
        }
    );
  }
}

class Entry {
  String date;
  Entry({required this.date});
}