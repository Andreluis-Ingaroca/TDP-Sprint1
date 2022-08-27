import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {

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
                      'Historial de Alertas',
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
                      'Ingresos sin cumplir Protocolos',
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

              Padding(
                padding: EdgeInsets.only(top: 10),
              ),

              Card(
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

              Padding(
                padding: EdgeInsets.only(top: 25),
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
        ),
      ),

    );
  }
}
