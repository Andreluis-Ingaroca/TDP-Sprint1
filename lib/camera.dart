import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:footer/alert.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  var imagen;
  String img = "";
  final ImagePicker picker = ImagePicker();
  String base64string = "";

  int x = 0;
  int cant = 0;

  String dniL = "";
  String dniS = "";
  String birthdate = "";
  String emissionDate = "";
  String expirationDate = "";

  String fullname = 'Luis Juan Flores Rodriguez';
  int age = 0;

  // changeX() {
  //   x = 3;
  // }

  sendBase(String base) async {
    Uri myUri = Uri.parse("https://covid-control-backend.azurewebsites.net/api/control/citizens-data");
    await http.post(myUri, headers: {
      'Content-Type': 'application/json',
    },
      body: jsonEncode({
        'image': base,
      }),
    ).then((res) {
      print("exito99999999999999: ${res.statusCode}");
      print("Response body: ${res.body}" );
      Map<dynamic, dynamic> data = jsonDecode(res.body);
      print("AQUI"+ data.toString());
      dniL = data["result"]["dni"];
      dniS = dniL.substring(36,44);
      birthdate = data["result"]["dates"]["birthdate"];
      emissionDate = data["result"]["dates"]["emissionDate"];
      expirationDate = data["result"]["dates"]["expirationDate"];
      x = 2;
      var join = birthdate.substring(6,10) + "-" + birthdate.substring(3,5) + "-" + birthdate.substring(0,2);
      var parsedDate = DateTime.parse(join);
      var dateCurrent = DateTime.now();
      var ageInD = dateCurrent.difference(parsedDate).inDays;
      age = ageInD ~/ 365;
      birthdate = birthdate.substring(0,2)+"/"+birthdate.substring(3,5)+"/"+birthdate.substring(6,10);
      emissionDate = emissionDate.substring(0,2)+"/"+emissionDate.substring(3,5)+"/"+emissionDate.substring(6,10);
      expirationDate = expirationDate.substring(0,2)+"/"+expirationDate.substring(3,5)+"/"+expirationDate.substring(6,10);
      // var parsedDate = DateTime.parse(birthdate)

      //Navigator.push(context, MaterialPageRoute(builder: (context) => MonitoringPage()));
      setState((){

      });
    }).catchError((err) {
      print("errr1111111111111111111: " + err);
    });
  }

  Future selImagen(op) async {

    try {
      var pickerFile;

      if (op == 1) {
        pickerFile = await picker.pickImage(source: ImageSource.camera);
      } else {
        pickerFile = await picker.pickImage(source: ImageSource.gallery);
      }

      if (pickerFile != null) {
        imagen = File(pickerFile.path);
        img = pickerFile.path;
        print("Slida "+ img);

        File imgFile = File(img);
        Uint8List imgBytes = await imgFile.readAsBytes();
        base64string = base64.encode(imgBytes);

        //print("GOLA "+base64string);

        setState(() {

        });

      } else {
        print('No seleccionaste ninguna foto');
      }

      Navigator.of(context).pop();

    } catch (e) {
      print("error while picking file");
    }
  }

  opciones(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Tomar una foto', style: TextStyle(fontSize: 16, color: Color(0xff2E3E5C), fontWeight: FontWeight.bold)),
                          ),
                          Icon(Icons.camera_alt_outlined, color: Color(0xff2E3E5C))
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Seleccionar una foto', style: TextStyle(fontSize: 16, color: Color(0xff2E3E5C), fontWeight: FontWeight.bold)),
                          ),
                          Icon(Icons.collections, color: Color(0xff2E3E5C))
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xff14A793)
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Cancelar', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(

            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //opciones(context),
                      if (x == 0)
                        ElevatedButton(
                          onPressed: () {
                            x = 1;
                            opciones(context);
                          },
                          child: Text('Seleccionar imagen', style: TextStyle(color: Colors.white, fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff14A793),
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Color(0xffD0DBEA))
                            ),
                          ),
                        ),

                      if (x == 0)
                        SizedBox(
                          height: 30,
                        ),

                      if (x == 1)
                        imagen == null ? Center() : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [Image.file(imagen), SizedBox(height: 30), ElevatedButton(onPressed: () { print("INICIOOOOOOOO " + base64string); sendBase(base64string); print("FINNNNNNNNNNNN ");}, child: Text('Enviar imagen', style: TextStyle(color: Colors.white, fontSize: 18)), style: ElevatedButton.styleFrom(
                            primary: Color(0xff14A793),
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Color(0xffD0DBEA))
                            ),
                          ),)]),
                        ),

                      if (x == 2)
                        Container(
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff9FA5C0)),
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: Column(
                                    children: const [
                                      Text(
                                        'Monitoreo de Información',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff2E3E5C),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),

                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Información Básica',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff2E3E5C),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff9FA5C0)),
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text('Usuario: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(fullname,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text('Edad: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(age.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text('DNI: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(dniS,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text('Fecha de Nacimiento: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(birthdate,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text('Fecha de Emision: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(emissionDate,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text('Fecha de Caducidad: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(expirationDate,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // SizedBox(
                                      //   width: 50,
                                      //   child: ListTile(
                                      //     leading: Text(
                                      //       'Usuario:',
                                      //       style: TextStyle(
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.bold
                                      //       ),
                                      //     ),
                                      //     title: Text(
                                      //       fullname,
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 35,
                                      //   child: ListTile(
                                      //     leading: Text(
                                      //       'Edad:',
                                      //       style: TextStyle(
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.bold
                                      //       ),
                                      //     ),
                                      //     title: Text(
                                      //       age.toString(),
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 35,
                                      //   child: ListTile(
                                      //     leading: Text(
                                      //       'DNI:',
                                      //       style: TextStyle(
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.bold
                                      //       ),
                                      //     ),
                                      //     title: Text(
                                      //       dniS,
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 35,
                                      //   child: ListTile(
                                      //     leading: Text(
                                      //       'Fecha de Nacimiento:',
                                      //       style: TextStyle(
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.bold
                                      //       ),
                                      //     ),
                                      //     title: Text(
                                      //       birthdate,
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 35,
                                      //   child: ListTile(
                                      //     leading: Text(
                                      //       'Fecha de Emision:',
                                      //       style: TextStyle(
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.bold
                                      //       ),
                                      //     ),
                                      //     title: Text(
                                      //       emissionDate,
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 35,
                                      //   child: ListTile(
                                      //     leading: Text(
                                      //       'Fecha de Caducidad:',
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.bold
                                      //       ),
                                      //     ),
                                      //     title: Text(
                                      //       expirationDate,
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),

                                Container(
                                  width: 350,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff14A793)),
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Cumple Protocolos',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff14A793),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 30),
                                ),

                                SizedBox(
                                  width: 350,
                                  height: 55,
                                  child: FlatButton(
                                    onPressed: (){
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        // false = user must tap button, true = tap outside dialog
                                        builder: (BuildContext dialogContext) {
                                          return AlertDialog(
                                            title: Text('Motivo de Excepción', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff2E3E5C), fontSize: 18.sp)),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: [

                                                  Card(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(color: Color(0xff9FA5C0), width: 1.w/2),
                                                        borderRadius: BorderRadius.circular(20),

                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(2.h),
                                                        child: TextField(
                                                          keyboardType: TextInputType.multiline,
                                                          maxLines: null,//or null
                                                          decoration: InputDecoration(
                                                              hintText: "Escribe el motivo del ingreso",
                                                              hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey),
                                                              suffixIcon: IconButton(onPressed: () {} ,icon: Icon(Icons.send_rounded), color: Color(0xff14A793))
                                                          ),
                                                        ),
                                                      )
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Text('Sugerencias', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C), fontSize: 14.sp), textAlign: TextAlign.start),

                                                      ),
                                                    ],
                                                  ),


                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: ElevatedButton(
                                                            onPressed: () {},
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color.fromRGBO(225, 225, 225, 1),
                                                                padding: EdgeInsets.all(1.h),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.h),
                                                                    side: BorderSide(color: Color(0xffD0DBEA))
                                                                ),
                                                                fixedSize: Size(100.w, 8.h)
                                                            ),
                                                            child: Text("Presenta carnet de vacunación con 3 dosis", style: TextStyle(color: Color(0xff2E3E5C), fontSize: 12.sp), textAlign: TextAlign.center)
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: ElevatedButton(
                                                            onPressed: () {},
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color.fromRGBO(225, 225, 225, 1),
                                                                padding: EdgeInsets.all(1.h),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(4.h),
                                                                    side: BorderSide(color: Color(0xffD0DBEA))
                                                                ),
                                                                fixedSize: Size(100.w, 8.h)
                                                            ),
                                                            child: Text("Es extranjero y tiene carnet de vacunación", style: TextStyle(color: Color(0xff2E3E5C), fontSize: 12.sp), textAlign: TextAlign.center)
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 3.h,
                                                  ),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: ElevatedButton(
                                                            onPressed: () {},
                                                            style: ElevatedButton.styleFrom(
                                                                primary: Color.fromRGBO(225, 225, 225, 1),
                                                                padding: EdgeInsets.all(1.h),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(4.h),
                                                                  side: BorderSide(color: Color(0xffD0DBEA)),
                                                                ),
                                                                fixedSize: Size(100.w, 8.h)
                                                            ),
                                                            child: Text("Es menor de edad", style: TextStyle(color: Color(0xff2E3E5C), fontSize: 12.sp), textAlign: TextAlign.center)
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cancelar', style: TextStyle(color: Color(0xff14A793), fontSize: 12.sp)),
                                                onPressed: () {
                                                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Aceptar', style: TextStyle(color: Color(0xff14A793), fontSize: 12.sp)),
                                                onPressed: () {
                                                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Ver detalle',
                                      style: TextStyle(
                                          fontSize: 18
                                      ),
                                    ),
                                    color: Colors.white,
                                    textColor: Color(0xff2E3E5C),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        side: BorderSide(color: Color(0xffD0DBEA))
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 7),
                                ),

                                SizedBox(
                                  width: 350,
                                  height: 55,
                                  child: FlatButton(
                                    onPressed: (){
                                      x = 2;
                                      setState(() {

                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AlertPage()));
                                    },
                                    child: Text(
                                      'Ver historial de alertas de Usuario',
                                      style: TextStyle(
                                          fontSize: 18
                                      ),
                                    ),
                                    color: Colors.white,
                                    textColor: Color(0xff2E3E5C),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        side: BorderSide(color: Color(0xffD0DBEA))
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      //if (x == 3)
                      // Container(
                      //   child: SingleChildScrollView(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     padding: EdgeInsets.only(top: 50.0),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Container(
                      //           width: 350,
                      //           margin: const EdgeInsets.all(15.0),
                      //           padding: const EdgeInsets.all(15.0),
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xff9FA5C0)),
                      //             color: Color(0xFFFFFFFF),
                      //             borderRadius: BorderRadius.circular(45),
                      //           ),
                      //           child: Column(
                      //             children: [
                      //               Text(
                      //                 'Historial de Alertas',
                      //                 textAlign: TextAlign.center,
                      //                 overflow: TextOverflow.ellipsis,
                      //                 style: const TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Color(0xff2E3E5C),
                      //                   fontSize: 27,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //
                      //         Padding(
                      //           padding: EdgeInsets.only(top: 30),
                      //         ),
                      //
                      //         Row(
                      //           children: [
                      //             SizedBox(
                      //               width: 25,
                      //             ),
                      //             Align(
                      //               alignment: Alignment.topLeft,
                      //               child: Text(
                      //                 'Ingresos sin cumplir Protocolos',
                      //                 textAlign: TextAlign.left,
                      //                 overflow: TextOverflow.ellipsis,
                      //                 style: const TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Color(0xff2E3E5C),
                      //                   fontSize: 22,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //
                      //         Padding(
                      //           padding: EdgeInsets.only(top: 10),
                      //         ),
                      //
                      //         Card(
                      //             margin: EdgeInsets.only(top: 25),
                      //             color: Colors.white,
                      //             shape: RoundedRectangleBorder(
                      //               side: BorderSide(color: Color(0xff9FA5C0)),
                      //               borderRadius: BorderRadius.circular(45),
                      //             ),
                      //             child: Padding(
                      //               padding: EdgeInsets.only(top: 25, left: 50, right: 50, bottom: 25),
                      //               child: Column(
                      //                 mainAxisAlignment: MainAxisAlignment.center,
                      //                 children: const <Widget>[
                      //
                      //                   Text('1º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                      //                   SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text('27-05-2022 (10:20:35)'),
                      //
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //
                      //                   Text('2º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                      //                   SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text('27-05-2022 (10:20:35)'),
                      //
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //
                      //                   Text('3º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                      //                   SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text('27-05-2022 (10:20:35)'),
                      //
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //
                      //                   Text('4º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                      //                   SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text('27-05-2022 (10:20:35)'),
                      //
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //
                      //                   Text('5º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                      //                   SizedBox(
                      //                     height: 5,
                      //                   ),
                      //                   Text('27-05-2022 (10:20:35)'),
                      //
                      //                 ],
                      //               ),
                      //             )
                      //         ),
                      //
                      //         Padding(
                      //           padding: EdgeInsets.only(top: 25),
                      //         ),
                      //
                      //         ElevatedButton(
                      //           child: Text('Ingreso ${cant} veces', style: TextStyle( color: Colors.red )),
                      //           style: ElevatedButton.styleFrom(
                      //               primary: Colors.white,
                      //               shape: StadiumBorder(),
                      //               side: BorderSide(color: Colors.red)
                      //           ),
                      //           onPressed: () { },
                      //         ),
                      //
                      //         ElevatedButton(
                      //           child: Text('Volver', style: TextStyle( color: Colors.red )),
                      //           style: ElevatedButton.styleFrom(
                      //               primary: Colors.white,
                      //               shape: StadiumBorder(),
                      //               side: BorderSide(color: Colors.red)
                      //           ),
                      //           onPressed: () { },
                      //         ),
                      //
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );

  }
}


// class ScanPage extends StatelessWidget {
//
//   int cant = 0;
//
//   ScanPage({ Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.only(top: 50.0, left: 30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                   width: 300,
//                   margin: const EdgeInsets.all(15.0),
//                   padding: const EdgeInsets.all(15.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xff9FA5C0)),
//                     //color: Color(0xFF4AAEFD), //blue
//                     borderRadius: BorderRadius.circular(45),
//                   ),
//                   child: const Text(
//                     //'Bienvenido $_name',
//                     'SCANER',
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xff2E3E5C),
//                       fontSize: 24,
//                     ),
//                   )
//               ),
//
//               // ElevatedButton(
//               //   child: Text('Alertas', style: TextStyle( color: Color(0xff2E3E5C) )),
//               //   style: ElevatedButton.styleFrom(
//               //       primary: Colors.white,
//               //       shape: StadiumBorder(),
//               //       side: BorderSide(color: Colors.black)
//               //   ),
//               //   onPressed: () {
//               //     showDialog<void>(
//               //       context: context,
//               //       barrierDismissible: false,
//               //       // false = user must tap button, true = tap outside dialog
//               //       builder: (BuildContext dialogContext) {
//               //         return AlertDialog(
//               //           //title: Text('Historial de Alertas', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff2E3E5C))),
//               //           content: Column(
//               //             children: [
//               //               Container(
//               //                   width: 300,
//               //                   margin: const EdgeInsets.all(15.0),
//               //                   padding: const EdgeInsets.all(15.0),
//               //                   decoration: BoxDecoration(
//               //                     border: Border.all(color: Color(0xff9FA5C0)),
//               //                     //color: Color(0xFF4AAEFD), //blue
//               //                     borderRadius: BorderRadius.circular(45),
//               //                   ),
//               //                   child: Text(
//               //                     //'Bienvenido $_name',
//               //                     'Historial de Alertas',
//               //                     textAlign: TextAlign.center,
//               //                     overflow: TextOverflow.ellipsis,
//               //                     style: const TextStyle(
//               //                       fontWeight: FontWeight.bold,
//               //                       color: Color(0xff2E3E5C),
//               //                       fontSize: 20,
//               //                     ),
//               //                   )
//               //               ),
//               //
//               //               Text('Ingresos sin cumplir Protocolos',
//               //                 textAlign: TextAlign.start,
//               //                 style: TextStyle(
//               //                   color: Color(0xff2E3E5C),
//               //                   fontWeight: FontWeight.bold,
//               //                 ),
//               //               ),
//               //
//               //               SingleChildScrollView(
//               //                 child: Card(
//               //                     margin: EdgeInsets.only(top: 25),
//               //                     color: Colors.white,
//               //                     shape: RoundedRectangleBorder(
//               //                       side: BorderSide(color: Color(0xff9FA5C0)),
//               //                       borderRadius: BorderRadius.circular(45),
//               //                     ),
//               //                     child: Padding(
//               //                       padding: EdgeInsets.only(top: 25, left: 50, right: 50, bottom: 25),
//               //                       child: Column(
//               //                         mainAxisAlignment: MainAxisAlignment.center,
//               //                         children: const <Widget>[
//               //
//               //                           Text('1º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
//               //                           SizedBox(
//               //                             height: 5,
//               //                           ),
//               //                           Text('27-05-2022 (10:20:35)'),
//               //
//               //                           SizedBox(
//               //                             height: 10,
//               //                           ),
//               //
//               //                           Text('2º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
//               //                           SizedBox(
//               //                             height: 5,
//               //                           ),
//               //                           Text('27-05-2022 (10:20:35)'),
//               //
//               //                           SizedBox(
//               //                             height: 10,
//               //                           ),
//               //
//               //                           Text('3º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
//               //                           SizedBox(
//               //                             height: 5,
//               //                           ),
//               //                           Text('27-05-2022 (10:20:35)'),
//               //
//               //                           SizedBox(
//               //                             height: 10,
//               //                           ),
//               //
//               //                           Text('4º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
//               //                           SizedBox(
//               //                             height: 5,
//               //                           ),
//               //                           Text('27-05-2022 (10:20:35)'),
//               //
//               //                           SizedBox(
//               //                             height: 10,
//               //                           ),
//               //
//               //                           Text('5º Ingreso', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
//               //                           SizedBox(
//               //                             height: 5,
//               //                           ),
//               //                           Text('27-05-2022 (10:20:35)'),
//               //
//               //                         ],
//               //                       ),
//               //                     )
//               //                 ),
//               //               ),
//               //
//               //               SizedBox(
//               //                 height: 20,
//               //               ),
//               //
//               //               ElevatedButton(
//               //                 child: Text('Ingreso ${cant} veces', style: TextStyle( color: Colors.red )),
//               //                 style: ElevatedButton.styleFrom(
//               //                     primary: Colors.white,
//               //                     shape: StadiumBorder(),
//               //                     side: BorderSide(color: Colors.red)
//               //                 ),
//               //                 onPressed: () { },
//               //               ),
//               //
//               //             ],
//               //           ),
//               //           actions: <Widget>[
//               //             TextButton(
//               //               child: Text('Cancelar', style: TextStyle(color: Color(0xff14A793))),
//               //               onPressed: () {
//               //                 Navigator.of(dialogContext).pop(); // Dismiss alert dialog
//               //               },
//               //             ),
//               //             TextButton(
//               //               child: Text('Aceptar', style: TextStyle(color: Color(0xff14A793))),
//               //               onPressed: () {
//               //                 Navigator.of(dialogContext).pop(); // Dismiss alert dialog
//               //               },
//               //             ),
//               //           ],
//               //         );
//               //       },
//               //     );
//               //   },
//               // ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

