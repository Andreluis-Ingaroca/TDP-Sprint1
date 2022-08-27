import 'package:reason/footer.dart';
import 'package:reason/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  //bool isHiddenPassword;

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(

      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          /*
          Image(
            image: AssetImage("assets/iniciosesion.png"),
            fit: BoxFit.cover,

          ),*/
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Text(
                'Inicia Sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),

              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark, primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: " Ingresa tu correo:"
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Ingresa tu contraseña:"
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        FloatingActionButton.extended(
                          label: Text('Ingresar'), // <-- Text
                          backgroundColor: Colors.white,
                          splashColor: Colors.green,
                          onPressed: () {
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        ),
                      ],
                    ),
                  ),
                ),

              ),


            ],

          )
        ],
      ),
    );
*/

    return Scaffold(
      //backgroundColor: Color(0xffd9fff6),
      body: Container(
        /*
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background1.png"),
            fit: BoxFit.cover,
          ),
        ),

         */

        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          //padding: EdgeInsets.all(10.0),
          padding: EdgeInsets.only(top: 150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Título
              Text('APP - COVID',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2E3E5C)
                ),
              ),

              //Espacio entre elementos
              Padding(
                padding: EdgeInsets.only(top: 70),
              ),

              //Input para el email
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email_outlined),
                    //hintText: "usuario",
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 18, color: Color(0xff9FA5C0),),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff14a793)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff14a793)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  obscureText: false,
                  maxLines: 1,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30),
              ),

              //Input para el dni
              SizedBox(
                width: 350,
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
                    labelStyle: TextStyle(fontSize: 18, color: Color(0xff9FA5C0),),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff14a793)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff14a793)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  obscureText: false,
                  maxLines: 1,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30),
              ),

              //Input para la contraseña
              SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock_outlined),
                    //1C6B60FF
                    //hintText: "Contraseña",
                    labelText: "Contraseña",
                    labelStyle: TextStyle(fontSize: 18, color: Color(0xff9FA5C0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff14a793)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff14a793)),
                      borderRadius: BorderRadius.circular(30),
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
                padding: EdgeInsets.only(top: 30),
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
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      FlatButton(
                        onPressed: () {

                        },
                        child: new Text("Regístrate",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff14A793),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 30),
              ),

              /*
              FlatButton(
                color: Theme.of(context).primaryColor,
                  onPressed: (){},
                  child: Center(
                    child: Text('Login', style: TextStyle(color: Colors.white),),
                  )
              )
               */
              //Botón de inicio sesión
              SizedBox(
                width: 350,
                height: 70,
                child: FloatingActionButton.extended(
                  backgroundColor: Color(0xff14A793),
                  label: Text('Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ), // <--
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Footer()));
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 150),
              ),
            ],
          ),
        ),
      ),
    );

  }
  /*
  void _passwordView(){
    if (isHiddenPassword == true){
      isHiddenPassword = false;
    }else{
      isHiddenPassword = true;
    }
    setState(() {
    });
  }

   */
}
