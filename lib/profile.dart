import 'package:footer/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Variables
  String name1 ='Luis';
  int dni = 77777776;
  String fullname = 'Luis Juan Flores Rodriguez';

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            //backgroundColor: Colors.blue,
            body: Container(

              child: SingleChildScrollView(
                //physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 280,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
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
                      padding: EdgeInsets.only(top: 20),
                    ),

                    Row(
                      children: const [
                        SizedBox(
                          width: 25,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Datos del Supervisor',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
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
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff9FA5C0)),
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                '       DNI:',
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
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                        ),
                        SizedBox(
                            width: 155,
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: (){
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  // false = user must tap button, true = tap outside dialog
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      title: Text('Confirmar', textAlign: TextAlign.start, style: TextStyle( color: Color(0xff2E3E5C), fontSize: 14.sp)),
                                      content: Text('¿Quieres salir de la aplicación?', style: TextStyle( color: Color(0xff2E3E5C), fontSize: 12.sp)),
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
                                            sharedPreferences.clear();
                                            sharedPreferences.commit();
                                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
                                            //Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );

                              },
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
                              ),
                            )
                          /*
                        FloatingActionButton.extended(
                          //Para que no salga error en por hero
                          heroTag: null,
                          //backgroundColor: Color(0xff0000ffff),
                          backgroundColor: Colors.white70.withOpacity(0.7),
                          label: Text('Cerrar Sesión',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xffEB0000)
                            ),
                          ), // <--
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                        ),
                        */
                          /*
                        Container(
                        height: 70,
                        width: 70,
                        child: Material(
                          type: MaterialType
                              .transparency,
                          child: Ink(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 3.0),
                              color: Colors.greenAccent,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                  500.0),
                              onTap: () {},
                              child: Icon(
                                Icons.add,
                                //size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                        */
                        ),
                      ],
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
