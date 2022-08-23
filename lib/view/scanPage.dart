import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {

  String da;

  ScanPage({ Key? key, required this.da }) : super(key: key);

  // @override
  // State<ScanPage> createState() => _ScanPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BarScan'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left_outlined),
        ),
      ),
      body: Column(
        children: [
          Text('HOLAA'),
          Text(this.da, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        ],
      ),
    );
  }

}

// class _ScanPageState extends State<ScanPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BarScan'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.chevron_left_outlined),
//         ),
//       ),
//       body: Column(
//         children: [
//           Text(this.da),
//         ],
//       ),
//     );
//   }
// }
