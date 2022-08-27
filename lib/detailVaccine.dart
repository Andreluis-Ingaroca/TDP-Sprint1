import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailVaccinePage extends StatefulWidget {

  @override
  State<DetailVaccinePage> createState() => _DetailVaccinePageState();
}

class _DetailVaccinePageState extends State<DetailVaccinePage> {
  //Variables

  List<Vaccine> vaccines = [
    Vaccine(name: "SINOPHARM", date: "Sábado 17 de Jul. 2021"),
    Vaccine(name: "SINOPHARM", date: "Sábado 22 de Jul. 2021"),
    Vaccine(name: "SINOPHARM", date: "Sábado 28 de Jul. 2021"),
  ];

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
                      'Detalle',
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
                      'Dosis de Vacunas',
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
                height: 250,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9FA5C0)),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: vaccines.map((userone){
                    final count = vaccines.indexOf(userone) + 1;
                    return Container(
                      child: ListTile(
                        leading: Text(count.toString() + '° Dosis'),
                        title: Text(userone.name),
                        subtitle: Text(userone.date),
                      ),
                      //margin: EdgeInsets.all(5),
                      //padding: EdgeInsets.all(5),
                    );
                  }).toList(),
                )
              ),

              Padding(
                padding: EdgeInsets.only(top: 25),
              ),

              Container(
                width: 350,
                height: 100,
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
                      'Actualmente no se le ha \n diagnosticado COVID en un rango de \n 14 días',
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

            ],
          ),
        ),
      ),

    );
  }
}
class Vaccine{
  String name, date;
  Vaccine({required this.name, required this.date});
}