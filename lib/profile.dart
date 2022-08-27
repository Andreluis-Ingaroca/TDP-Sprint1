import 'package:reason/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Variables
  String name1 ='Luis';
  int dni = 77777776;
  String fullname = 'Luis Juan Flores Rodriguez';

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
                width: 280,
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
                      //'Bienvenido $_name',
                      'Bienvenido ' + name1,
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
                      'Datos del Supervisor',
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
                height: 400,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9FA5C0)),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          //'Bienvenido $_name',
                          'Nombre: ',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
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
                              fontWeight: FontWeight.bold,
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
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 19
                          ),
                        ),
                        Text(
                          //'Bienvenido $_name',
                          dni.toString(),
                          //textAlign: TextAlign.center,
                          //overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2E3E5C),
                              fontSize: 20
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 210,
                  ),
                  SizedBox(
                      width: 155,
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: (){},
                        icon: Icon(
                          Icons.logout,
                          color: Color(0xffEB0000),
                        ),
                        label: Text(
                          'Cerrar Sesión',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xffEB0000),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 2.0,
                            color: Color(0xffEB0000),
                            style: BorderStyle.solid,
                          ),
                          shape: StadiumBorder(),
                      ))
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
