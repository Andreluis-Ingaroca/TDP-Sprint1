import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecordPage extends StatefulWidget {

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  List<Exception> exceptions = [
    Exception(name: "Juan Jose Torres", date: "27-05-2022 10:20:35"),
    Exception(name: "Pedro Damian Soto", date: "27-05-2022 10:20:35"),
    Exception(name: "Dolores Josefina Quito", date: "27-05-2022 10:20:35"),
    Exception(name: "Luana Maria Castro", date: "27-05-2022 10:20:35"),
  ];

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                //physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 5.h, left: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                        width: 85.w,
                        margin: EdgeInsets.all(3.h),
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff9FA5C0)),
                          //color: Color(0xFF4AAEFD), //blue
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Text(
                          //'Bienvenido $_name',
                          'Historial de Excepciones',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2E3E5C),
                            fontSize: 19.sp,
                          ),
                        )
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Personas autorizadas de Ingresar',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xff2E3E5C),
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp
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
                          children: exceptions.map((user){
                            final count = exceptions.indexOf(user) + 1;
                            return Container(
                              child: ListTile(
                                leading: Text(count.toString() + '° ', style: TextStyle(color: Color(0xff2E3E5C), fontWeight: FontWeight.bold, fontSize: 11.sp)),
                                title: Text(user.name, style: TextStyle(color: Color(0xff2E3E5C), fontWeight: FontWeight.bold, fontSize: 11.sp)),
                                subtitle: Text(user.date, style: TextStyle(color: Color(0xff2E3E5C), fontSize: 10.sp)),
                              ),
                              //margin: EdgeInsets.all(5),
                              //padding: EdgeInsets.all(5),
                            );
                          }).toList(),
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                    ),

                    // SingleChildScrollView(
                    //   child: Card(
                    //       margin: const EdgeInsets.all(50.0),
                    //       color: Colors.white,
                    //       shape: RoundedRectangleBorder(
                    //         side: BorderSide(color: Color(0xff9FA5C0)),
                    //         borderRadius: BorderRadius.circular(45),
                    //       ),
                    //       child: Padding(
                    //         padding: EdgeInsets.all(40.0),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: const <Widget>[
                    //
                    //             Text('1º Juan Jose Flores', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text('27-05-2022 (10:20:35)'),
                    //
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //
                    //             Text('2º Juan Jose Perez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text('27-05-2022 (10:20:35)'),
                    //
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //
                    //             Text('3º Juan Jose Dominguez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text('27-05-2022 (10:20:35)'),
                    //
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //
                    //             Text('4º Juan Jose Suarez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text('27-05-2022 (10:20:35)'),
                    //
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //
                    //             Text('5º Juan Jose Martinez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text('27-05-2022 (10:20:35)'),
                    //
                    //           ],
                    //         ),
                    //       )
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

class Exception {
  String name, date;
  Exception({ required this.name, required this.date});
}
