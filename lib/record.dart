import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 50.0, left: 30.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
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
                    'Historial de Excepciones',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E3E5C),
                      fontSize: 24,
                    ),
                  )
              ),
              
              Text('Personas autorizadas de Ingresar',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xff2E3E5C),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SingleChildScrollView(
                child: Card(
                    margin: const EdgeInsets.all(50.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xff9FA5C0)),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[

                          Text('1º Juan Jose Flores', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                          SizedBox(
                            height: 5,
                          ),
                          Text('27-05-2022 (10:20:35)'),

                          SizedBox(
                            height: 10,
                          ),

                          Text('2º Juan Jose Perez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                          SizedBox(
                            height: 5,
                          ),
                          Text('27-05-2022 (10:20:35)'),

                          SizedBox(
                            height: 10,
                          ),

                          Text('3º Juan Jose Dominguez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                          SizedBox(
                            height: 5,
                          ),
                          Text('27-05-2022 (10:20:35)'),

                          SizedBox(
                            height: 10,
                          ),

                          Text('4º Juan Jose Suarez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                          SizedBox(
                            height: 5,
                          ),
                          Text('27-05-2022 (10:20:35)'),

                          SizedBox(
                            height: 10,
                          ),

                          Text('5º Juan Jose Martinez', style: TextStyle( fontWeight: FontWeight.bold, color: Color(0xff2E3E5C) )),
                          SizedBox(
                            height: 5,
                          ),
                          Text('27-05-2022 (10:20:35)'),

                        ],
                      ),
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
