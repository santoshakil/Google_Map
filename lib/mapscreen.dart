import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_flutter_app/jobapicall.dart';
import 'package:google_map_flutter_app/jobdetails.dart';
import 'package:google_map_flutter_app/mapdata.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TapEventsOnMap extends StatefulWidget {
  @override
  _TapEventsOnMapState createState() => _TapEventsOnMapState();
}

class _TapEventsOnMapState extends State<TapEventsOnMap> {
 //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controller;
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchaddress;
 // Future<MapDataModel> jobs;
  static const LatLng _center = const LatLng(23.773649, 90.411472);
  static const LatLng _anotherLatLng = const LatLng(23.782448, 90.421682);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller=controller;
    });
  }


  static MarkerId markerId1 = MarkerId("1");
  static MarkerId markerId2 = MarkerId("12");

  final Set<Marker> _markers = {
    Marker(
      markerId: markerId1,
      position: _center,
      infoWindow: InfoWindow(
        title: 'IshRaak Solutions Limited',
        snippet: 'Ishraak.com',
      ),
      onTap: (){
        _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
          return AlertDialog(
            title: new Text("Ishraak Solutions Limited"),
            content: new Text("Software Company"),
            backgroundColor: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Go To Details Page"),
                textColor: Colors.greenAccent,
                onPressed: () {
                  // this._yesOnPressed();
                },
              ),
              new FlatButton(
                child: Text("No"),
                textColor: Colors.redAccent,
                onPressed: () {
                  // this._noOnPressed();
                },
              ),
            ],
          );
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails()));
        },
        );
      },
    ),
    Marker(
      markerId: markerId2,
      position: _anotherLatLng,
      infoWindow: InfoWindow(
        title: 'Tiger IT Limited',
        snippet: 'Tigerit.com',
      ),
      onTap: (){
        _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
          return AlertDialog(
            title: new Text("Tiger IT Limited"),
            content: new Text("Software Company"),
            backgroundColor: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Go To Details Page"),
                textColor: Colors.redAccent,
                onPressed: () {
                  // this._yesOnPressed();
                },
              ),
              new FlatButton(
                child: Text("No"),
                textColor: Colors.redAccent,
                onPressed: () {
                  // this._noOnPressed();
                },
              ),
            ],
          );
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails()));
        },
        );
      },


    )
  };

  // Widget _googleMap(MapDataModel _jobsData){
  //   return Container(
  //       child: GoogleMap(
  //         onTap: (latLng){
  //           _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}"),));
  //         },
  //         markers: _markers,
  //         onMapCreated: _onMapCreated,
  //         initialCameraPosition: CameraPosition(
  //           target: _center,
  //           zoom: 11.0,
  //         ),
  //       ),
  //   );
  // }

  // Future<MapDataModel> jobs;
  // static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //
  // Widget GoogleMapp() {
  //   return FutureBuilder(
  //       future: jobs,
  //       builder:(context,snapshot){
  //         snapshot.hasData ? ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,index){
  //           return GoogleMapTile(
  //              id: snapshot["id"],
  //           );
  //         }) : Container();
  //       } );
  //
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // //jobs=ApIManager().getJobs();
    // print(jobs);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Search Job Location'),
          backgroundColor: Colors.yellow,
        ),
        body:Stack(
          children: [
            GoogleMap(
              // onTap: (latLng){
              //   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}"),));
              // },
              markers: _markers,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12.0,
              ),
            ),

            _searchlocation(),
            // FlatButton(onPressed: (){
            //   print("API DATA"+jobs.toString());
            // }, child: Text("Fetch"))


          ],
        ),
      ),
    );
  }
  _searchlocation(){
   return Positioned(
      top: 30,
      left: 15,
      right: 15,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white
        ),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter Address",
              alignLabelWithHint: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:15,left: 15,right: 15),
              suffixIcon: IconButton(icon: Icon(Icons.search) ,onPressed: searchaddressandNav,iconSize: 30,)
          ),
          onChanged: (value){
            setState(() {
              searchaddress=value;
            });
          },
        ),

      ),
    );
  }
  searchaddressandNav(){
    Geolocator().placemarkFromAddress(searchaddress).then((result) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
    });
  }
}

// class GoogleMapTile extends StatefulWidget {
//   var id,jobtype,companyName,latitude,longitude;
//   GoogleMapTile({@required this.id,@required this.jobtype,@required this.companyName,@required this.latitude,@required this.longitude});
//   @override
//   _GoogleMapTileState createState() => _GoogleMapTileState();
// }
//
// class _GoogleMapTileState extends State<GoogleMapTile> {
//   GoogleMapController _controller;
//   static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String searchaddress;
//   Future<MapDataModel> jobs;
//   static const LatLng _center = const LatLng(23.773649, 90.411472);
//   static const LatLng _anotherLatLng = const LatLng(23.782448, 90.421682);
//
//
//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _controller=controller;
//     });
//   }
//
//
//   static MarkerId markerId1 = MarkerId("1");
//   static MarkerId markerId2 = MarkerId("12");
//
//   final Set<Marker> _markers = {
//     Marker(
//       markerId: markerId1,
//       position: _center,
//       infoWindow: InfoWindow(
//         title: 'IshRaak Solutions Limited',
//         snippet: 'Ishraak.com',
//       ),
//       onTap: (){
//         _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
//           return AlertDialog(
//             title: new Text("Ishraak Solutions Limited"),
//             content: new Text("Software Company"),
//             backgroundColor: Colors.white,
//             shape:
//             RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
//             actions: <Widget>[
//               new FlatButton(
//                 child: new Text("Go To Details Page"),
//                 textColor: Colors.greenAccent,
//                 onPressed: () {
//                   // this._yesOnPressed();
//                 },
//               ),
//               new FlatButton(
//                 child: Text("No"),
//                 textColor: Colors.redAccent,
//                 onPressed: () {
//                   // this._noOnPressed();
//                 },
//               ),
//             ],
//           );
//           // Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails()));
//         },
//         );
//       },
//     ),
//     Marker(
//       markerId: markerId2,
//       position: _anotherLatLng,
//       infoWindow: InfoWindow(
//         title: 'Tiger IT Limited',
//         snippet: 'Tigerit.com',
//       ),
//       onTap: (){
//         _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
//           return AlertDialog(
//             title: new Text("Tiger IT Limited"),
//             content: new Text("Software Company"),
//             backgroundColor: Colors.white,
//             shape:
//             RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
//             actions: <Widget>[
//               new FlatButton(
//                 child: new Text("Go To Details Page"),
//                 textColor: Colors.redAccent,
//                 onPressed: () {
//                   // this._yesOnPressed();
//                 },
//               ),
//               new FlatButton(
//                 child: Text("No"),
//                 textColor: Colors.redAccent,
//                 onPressed: () {
//                   // this._noOnPressed();
//                 },
//               ),
//             ],
//           );
//           // Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails()));
//         },
//         );
//       },
//
//
//     )
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           GoogleMap(
//             onTap: (latLng){
//               _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}"),));
//             },
//             markers: _markers,
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 11.0,
//             ),
//           ),
//           _searchlocation(),
//         ],
//       ),
//     );
//   }
//   _searchlocation(){
//     return Positioned(
//       top: 30,
//       left: 15,
//       right: 15,
//       child: Container(
//         height: 50,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             color: Colors.white
//         ),
//         child: TextField(
//           decoration: InputDecoration(
//               hintText: "Enter Address",
//               alignLabelWithHint: true,
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top:15,left: 15,right: 15),
//               suffixIcon: IconButton(icon: Icon(Icons.search) ,onPressed: searchaddressandNav,iconSize: 30,)
//           ),
//           onChanged: (value){
//             setState(() {
//               searchaddress=value;
//             });
//           },
//         ),
//
//       ),
//     );
//   }
//   searchaddressandNav(){
//     Geolocator().placemarkFromAddress(searchaddress).then((result) {
//       _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//           target:
//           LatLng(result[0].position.latitude, result[0].position.longitude),
//           zoom: 10.0)));
//     });
//   }
// }

