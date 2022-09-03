import 'package:footer/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;

  bool _isLoading = false;
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //bool isHiddenPassword;

  signIn(String username, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var jsonResponse = null;
    Uri myUri = Uri.parse("https://covid-control-backend.azurewebsites.net/api/auth/login");

    var response = await http.post(myUri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Footer()), (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }

    //Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));

  }

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
              //padding: EdgeInsets.all(10.0),
              padding: EdgeInsets.only(top: 14.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Título
                  Text('APP - COVID',
                    style: TextStyle(
                      fontSize: 42.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E3E5C)
                    ),
                  ),

                  //Espacio entre elementos
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                  ),

                  //Input para el email
                  SizedBox(
                    //width: MediaQuery.of(context).size.width*0.85,
                    width: 85.w,
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.email_outlined),
                        //hintText: "usuario",
                        labelText: "Email",
                        labelStyle: TextStyle(fontSize: 15.sp, color: Color(0xff9FA5C0),),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff14a793)),
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff14a793)),
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      obscureText: false,
                      maxLines: 1,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                  ),

                  //Input para el dni
                  SizedBox(
                    //width: MediaQuery.of(context).size.width*0.85,
                    width: 85.w,
                    child: TextField(
                      //maxLength: 8,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                            Icons.switch_account_outlined
                        ),
                        //hintText: "dni",
                        labelText: "DNI",
                        labelStyle: TextStyle(fontSize: 15.sp, color: Color(0xff9FA5C0),),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff14a793)),
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff14a793)),
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                      ),
                      obscureText: false,
                      maxLines: 1,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                  ),

                  //Input para la contraseña
                  SizedBox(
                    //width: MediaQuery.of(context).size.width*0.85,
                    width: 85.w,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock_outlined),
                        //1C6B60FF
                        //hintText: "Contraseña",
                        labelText: "Contraseña",
                        labelStyle: TextStyle(fontSize: 15.sp, color: Color(0xff9FA5C0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff14a793)),
                          borderRadius: BorderRadius.circular(4.h),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff14a793)),
                          borderRadius: BorderRadius.circular(4.h),
                        ),

                        //Mostrar/Ocultar contraseña
                          suffixIcon: GestureDetector(
                            onTap: (){
                              //isHiddenPassword =! isHiddenPassword;
                              setState(() {
                                isHiddenPassword =! isHiddenPassword;
                              });
                            },
                            child: Icon(
                                isHiddenPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined
                            ),
                          ),
                          /*
                          InkWell(
                            onTap: _passwordView,
                            child: Icon(
                              //_passwordView() ? Icons.visibility : Icons.visibility_off,
                              Icons.visibility,
                              color: Colors.black,
                            ),
                          ),
                        */
                      ),
                      obscureText: isHiddenPassword,
                      maxLines: 1,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                  ),

                  //Línea para botón de registrar cuenta
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("¿Aún no tienes cuenta?",
                            style: TextStyle(
                              color: Color(0xff2E3E5C),
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          FlatButton(
                            onPressed: () {

                            },
                            child: Text("Regístrate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Color(0xff14A793),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                  ),

                  //Botón de inicio sesión
                  SizedBox(
                    //width: MediaQuery.of(context).size.width*0.85,
                    width: 85.w,
                    height: 10.h,
                    child: FloatingActionButton.extended(
                      backgroundColor: Color(0xff14A793),
                      label: Text('Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ), // <--
                      // onPressed: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => Footer()));
                      // },
                      onPressed: usernameController.text == "" || passwordController == "" ? null : () {
                        setState(() {
                          _isLoading = true;
                        });
                        signIn(usernameController.text, passwordController.text);
                      },
                    ),

                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                  ),

            ],
          ),
        ),
        );
      }
    );

    // return Scaffold(
    //   //backgroundColor: Color(0xffd9fff6),
    //   body: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     //physics: NeverScrollableScrollPhysics(),
    //     //padding: EdgeInsets.all(10.0),
    //     padding: EdgeInsets.only(top: 150.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         //Título
    //         Text('APP - COVID',
    //           style: TextStyle(
    //             fontSize: 50.sp,
    //             fontWeight: FontWeight.bold,
    //             color: Color(0xff2E3E5C)
    //           ),
    //         ),
    //
    //         //Espacio entre elementos
    //         Padding(
    //           padding: EdgeInsets.only(top: 70),
    //         ),
    //
    //         //Input para el email
    //         SizedBox(
    //           //width: MediaQuery.of(context).size.width*0.85,
    //           width: 85.w,
    //           child: TextField(
    //             controller: usernameController,
    //             decoration: InputDecoration(
    //               filled: true,
    //               fillColor: Colors.white,
    //               prefixIcon: Icon(Icons.email_outlined),
    //               //hintText: "usuario",
    //               labelText: "Email",
    //               labelStyle: TextStyle(fontSize: 18, color: Color(0xff9FA5C0),),
    //               border: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Color(0xff14a793)),
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Color(0xff14a793)),
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //             ),
    //             obscureText: false,
    //             maxLines: 1,
    //           ),
    //         ),
    //
    //         Padding(
    //           padding: EdgeInsets.only(top: 30),
    //         ),
    //
    //         //Input para el dni
    //         SizedBox(
    //           //width: MediaQuery.of(context).size.width*0.85,
    //           width: 85.w,
    //           child: TextField(
    //             //maxLength: 8,
    //             decoration: InputDecoration(
    //               filled: true,
    //               fillColor: Colors.white,
    //               prefixIcon: Icon(
    //                   Icons.switch_account_outlined
    //               ),
    //               //hintText: "dni",
    //               labelText: "DNI",
    //               labelStyle: TextStyle(fontSize: 18, color: Color(0xff9FA5C0),),
    //               border: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Color(0xff14a793)),
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Color(0xff14a793)),
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //             ),
    //             obscureText: false,
    //             maxLines: 1,
    //           ),
    //         ),
    //
    //         Padding(
    //           padding: EdgeInsets.only(top: 30),
    //         ),
    //
    //         //Input para la contraseña
    //         SizedBox(
    //           //width: MediaQuery.of(context).size.width*0.85,
    //           width: 85.w,
    //           child: TextField(
    //             controller: passwordController,
    //             decoration: InputDecoration(
    //               filled: true,
    //               fillColor: Colors.white,
    //               prefixIcon: Icon(Icons.lock_outlined),
    //               //1C6B60FF
    //               //hintText: "Contraseña",
    //               labelText: "Contraseña",
    //               labelStyle: TextStyle(fontSize: 18, color: Color(0xff9FA5C0),
    //               ),
    //               border: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Color(0xff14a793)),
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Color(0xff14a793)),
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //
    //               //Mostrar/Ocultar contraseña
    //                 suffixIcon: GestureDetector(
    //                   onTap: (){
    //                     //isHiddenPassword =! isHiddenPassword;
    //                     setState(() {
    //                       isHiddenPassword =! isHiddenPassword;
    //                     });
    //                   },
    //                   child: Icon(
    //                       isHiddenPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined
    //                   ),
    //                 ),
    //                 /*
    //                 InkWell(
    //                   onTap: _passwordView,
    //                   child: Icon(
    //                     //_passwordView() ? Icons.visibility : Icons.visibility_off,
    //                     Icons.visibility,
    //                     color: Colors.black,
    //                   ),
    //                 ),
    //               */
    //             ),
    //             obscureText: isHiddenPassword,
    //             maxLines: 1,
    //           ),
    //         ),
    //
    //         Padding(
    //           padding: EdgeInsets.only(top: 30),
    //         ),
    //
    //         //Línea para botón de registrar cuenta
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Text("¿Aún no tienes cuenta?",
    //                   style: TextStyle(
    //                     color: Color(0xff2E3E5C),
    //                     fontSize: 16,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 FlatButton(
    //                   onPressed: () {
    //
    //                   },
    //                   child: Text("Regístrate",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 16,
    //                       color: Color(0xff14A793),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //
    //         Padding(
    //           padding: EdgeInsets.only(top: 30),
    //         ),
    //
    //         //Botón de inicio sesión
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 30.0),
    //           child: SizedBox(
    //             //width: MediaQuery.of(context).size.width*0.85,
    //             width: 85.w,
    //             height: 70,
    //             child: FloatingActionButton.extended(
    //               backgroundColor: Color(0xff14A793),
    //               label: Text('Iniciar Sesión',
    //                 style: TextStyle(
    //                   fontSize: 17,
    //                 ),
    //               ), // <--
    //               // onPressed: () {
    //               //   Navigator.push(context, MaterialPageRoute(builder: (context) => Footer()));
    //               // },
    //               onPressed: usernameController.text == "" || passwordController == "" ? null : () {
    //                 setState(() {
    //                   _isLoading = true;
    //                 });
    //                 signIn(usernameController.text, passwordController.text);
    //               },
    //             ),
    //
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );

  }
}
