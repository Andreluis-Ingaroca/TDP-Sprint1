import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {

  String d;
  int cant = 0;

  ScanPage({ Key? key, required this.d }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 50.0, left: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9FA5C0)),
                    //color: Color(0xFF4AAEFD), //blue
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Text(
                    //'Bienvenido $_name',
                    'SCANER',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E3E5C),
                      fontSize: 24,
                    ),
                  )
              ),

              ElevatedButton(
                child: Text('Alertas', style: TextStyle( color: Color(0xff2E3E5C) )),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.black)
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    // false = user must tap button, true = tap outside dialog
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        //title: Text('Historial de Alertas', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff2E3E5C))),
                        content: Column(
                          children: [
                            Container(
                                width: 300,
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff9FA5C0)),
                                  //color: Color(0xFF4AAEFD), //blue
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Text(
                                  //'Bienvenido $_name',
                                  'Historial de Alertas',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2E3E5C),
                                    fontSize: 20,
                                  ),
                                )
                            ),

                            Text('Ingresos sin cumplir Protocolos',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xff2E3E5C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SingleChildScrollView(
                              child: Card(
                                  margin: EdgeInsets.only(top: 25),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xff9FA5C0)),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 25, left: 50, right: 50, bottom: 25),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const <Widget>[

                                        Text('1º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('27-05-2022 (10:20:35)'),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Text('2º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('27-05-2022 (10:20:35)'),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Text('3º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('27-05-2022 (10:20:35)'),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Text('4º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('27-05-2022 (10:20:35)'),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        Text('5º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('27-05-2022 (10:20:35)'),

                                      ],
                                    ),
                                  )
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            ElevatedButton(
                              child: Text('Ingreso ${cant} veces', style: TextStyle( color: Colors.red )),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: StadiumBorder(),
                                  side: BorderSide(color: Colors.red)
                              ),
                              onPressed: () { },
                            ),

                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancelar', style: TextStyle(color: Color(0xff14A793))),
                            onPressed: () {
                              Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                            },
                          ),
                          TextButton(
                            child: Text('Aceptar', style: TextStyle(color: Color(0xff14A793))),
                            onPressed: () {
                              Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              // ElevatedButton(
              //   child: Text('Alertas'),
              //   onPressed: () {
              //
              //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => AlertPage()), (Route<dynamic> route) => false);
              //
              //     // showDialog<void>(
              //     //   context: context,
              //     //   barrierDismissible: false,
              //     //   // false = user must tap button, true = tap outside dialog
              //     //   builder: (BuildContext dialogContext) {
              //     //     return AlertDialog(
              //     //       title: Text('Motivo de Excepción', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff2E3E5C)),),
              //     //       content: Column(
              //     //         children: [
              //     //
              //     //           const Card(
              //     //               color: Colors.white,
              //     //               shape: RoundedRectangleBorder(
              //     //                   side: BorderSide(
              //     //                     color: Colors.black,
              //     //                   )
              //     //               ),
              //     //               child: Padding(
              //     //                 padding: EdgeInsets.all(5.0),
              //     //                 child: TextField(
              //     //                   maxLines: 4, //or null
              //     //                   decoration: InputDecoration(
              //     //                     hintText: "Escribe acerca del motivo del ingreso",
              //     //                   ),
              //     //                 ),
              //     //               )
              //     //           ),
              //     //
              //     //           const SizedBox(
              //     //             height: 20,
              //     //           ),
              //     //
              //     //           Text('Sugerencias', style: TextStyle( fontWeight: FontWeight.bold), textAlign: TextAlign.left),
              //     //
              //     //           const SizedBox(
              //     //             height: 20,
              //     //           ),
              //     //
              //     //           Row(
              //     //             children: [
              //     //               Expanded(
              //     //                 child: ElevatedButton(
              //     //                     onPressed: () {},
              //     //                     child: Text("Presenta carnet de vacunación con 3 dosis", textAlign: TextAlign.center)
              //     //                 ),
              //     //               ),
              //     //             ],
              //     //           ),
              //     //
              //     //           const SizedBox(
              //     //             height: 20,
              //     //           ),
              //     //
              //     //           Row(
              //     //             children: [
              //     //               Expanded(
              //     //                 child: ElevatedButton(
              //     //                     onPressed: () {},
              //     //                     child: Text("Es extranjero y tiene carnet de vacunación", textAlign: TextAlign.center)
              //     //                 ),
              //     //               ),
              //     //             ],
              //     //           ),
              //     //
              //     //           const SizedBox(
              //     //             height: 20,
              //     //           ),
              //     //
              //     //           Row(
              //     //             children: [
              //     //               Expanded(
              //     //                 child: ElevatedButton(
              //     //                     onPressed: () {},
              //     //                     child: Text("Es menor de edad", textAlign: TextAlign.center)
              //     //                 ),
              //     //               ),
              //     //             ],
              //     //           )
              //     //         ],
              //     //       ),
              //     //       actions: <Widget>[
              //     //         TextButton(
              //     //           child: Text('Cancelar'),
              //     //           onPressed: () {
              //     //             Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              //     //           },
              //     //         ),
              //     //         TextButton(
              //     //           child: Text('Aceptar'),
              //     //           onPressed: () {
              //     //             Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              //     //           },
              //     //         ),
              //     //       ],
              //     //     );
              //     //   },
              //     // );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

