import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_flutter_app/homepage.dart';
import 'package:google_map_flutter_app/mapscreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:geocoder/geocoder.dart';
// import 'package:geocoding/geocoding.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TapEventsOnMap(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
// GoogleMapController mapController;
//
// String searchaddress;
// List<Marker> allMarker=[];
//
//
//
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     allMarker.add(Marker(
//       markerId: MarkerId("My Marker"),
//       draggable: false,
//       onTap: (){
//         print("Marker Place");
//       },
//       //position: LatLng(searchaddress),
//     ));
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             GoogleMap(onMapCreated: onMapCreates,initialCameraPosition: CameraPosition(
//               target: LatLng(23.810331,90.412521),
//               zoom: 11.0,
//             ),),
//         Positioned(
//           top: 30,
//           left: 15,
//           right: 15,
//           child: Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: Colors.white
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter Address",
//                 alignLabelWithHint: true,
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top:15,left: 15,right: 15),
//                 suffixIcon: IconButton(icon: Icon(Icons.search) ,onPressed: searchandNavigate,iconSize: 30,)
//               ),
//               onChanged: (value){
//                 setState(() {
//                   searchaddress=value;
//                 });
//               },
//             ),
//
//           ),
//         )
//           ],
//         ),
//       ),
//
//     );
//   }
//
// searchandNavigate() {
//   Geolocator().placemarkFromAddress(searchaddress).then((result) {
//     mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target:
//         LatLng(result[0].position.latitude, result[0].position.longitude),
//         zoom: 10.0)));
//   });
// }
//
//   void onMapCreates(controller){
//     setState(() {
//       mapController=controller;
//     });
//   }
// }
