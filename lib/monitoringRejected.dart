import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reason/alert.dart';

import 'detailVaccine.dart';

class MonitoringRejectedPage extends StatefulWidget {

  @override
  State<MonitoringRejectedPage> createState() => _MonitoringRejectedPageState();
}

class _MonitoringRejectedPageState extends State<MonitoringRejectedPage> {
  //Variables
  int dni = 77777776;
  String fullname = 'Luis Juan Flores Rodriguez';
  int age = 20;
  int cant = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Container(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9FA5C0)),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Column(
                  children: [
                    Text(
                      'Monitoreo de Información',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2E3E5C),
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Información Básica',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2E3E5C),
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                width: 350,
                height: 170,
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
                      SizedBox(
                        height: 35,
                        child: ListTile(
                          leading: Text(
                            'Usuario:',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Text(
                            fullname,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 35,
                        child: ListTile(
                          leading: Text(
                              'Edad:',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Text(
                              age.toString(),
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: ListTile(
                          leading: Text(
                            'DNI:',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          title: Text(
                            dni.toString(),
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  //margin: EdgeInsets.all(5),
                  //padding: EdgeInsets.all(5),

                /*
                Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          //'Bienvenido $_name',
                          'Usuario: ',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 20
                          ),
                        ),
                        Text(
                          //'Bienvenido $_name',
                          'Edad: ',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 20
                          ),
                        ),
                        Text(
                          //'Bienvenido $_name',
                          'DNI: ',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 20
                          ),
                        ),
                      ],
                    ),

                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //'Bienvenido $_name',
                          fullname,
                          //textAlign: TextAlign.center,
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 19
                          ),
                        ),
                        Text(
                          //'Bienvenido $_name',
                          age.toString(),
                          //textAlign: TextAlign.center,
                          //overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 20
                          ),
                        ),
                        Text(
                          //'Bienvenido $_name',
                          dni.toString(),
                          //textAlign: TextAlign.center,
                          //overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            //fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 20
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                */
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),
              ),

              Container(
                width: 350,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffEB0000)),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Column(
                  children: [
                    Text(
                      'No cumple Protocolos',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffEB0000),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: FloatingActionButton.extended(
                      heroTag: null,
                      backgroundColor: Color(0xffEB0000),
                      label: Text('No Ingresar',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ), // <--
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: FloatingActionButton.extended(
                      heroTag: null,
                      backgroundColor: Color(0xff14A793),
                      label: Text('Ingresar',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ), // <--
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 20),
              ),

              SizedBox(
                width: 350,
                height: 55,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailVaccinePage()));
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

              // Padding(
              //   padding: EdgeInsets.only(top: 7),
              // ),

              SizedBox(
                width: 350,
                height: 55,
                child: FlatButton(
                  onPressed: (){ },
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

    );
  }
}
