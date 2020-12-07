import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GoogleMapController _controller ;
  String searchaddress;
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        // leading: IconButton(
        //     icon: Icon(FontAwesomeIcons.arrowLeft),
        //     onPressed: () {
        //       //
        //     }),
        title: Text("Search Location",style: TextStyle(color: Colors.white),),
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(FontAwesomeIcons.search),
        //       onPressed: () {
        //         //
        //       }),
        // ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            // _zoomminusfunction(),
            // _zoomplusfunction(),
            _searchlocation(context),
            _buildContainer(),
          ],
        ),
      ),
    );
  }
  //
  // Widget _zoomminusfunction() {
  //
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: IconButton(
  //         icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
  //         onPressed: () {
  //           zoomVal--;
  //           _minus( zoomVal);
  //         }),
  //   );
  // }
  // Widget _zoomplusfunction() {
  //
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: IconButton(
  //         icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
  //         onPressed: () {
  //           zoomVal++;
  //           _plus(zoomVal);
  //         }),
  //   );
  // }

  // Future<void> _minus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  // }
  // Future<void> _plus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  // }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "asste/jobe.jpg",
                  23.776141, 90.414745,"Ishraak Solutions Limited"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "asste/tiger-it.png",
                  23.779302, 90.416096,"Tiger IT Limited"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "asste/starD.png",
                  23.775851, 90.412223,"Star Design DB"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "5.00",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Dhaka \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Open \u00B7 Closed 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(23.810331, 90.412521), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _controller=controller;
          });
        },
        markers: {
          // newyork1Marker,newyork2Marker,newyork3Marker,

          gramercyMarker,bernardinMarker,blueMarker
        },
      ),
    );
  }

  Widget _searchlocation(BuildContext context) {
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

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 16,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('Jobxprss'),
  onTap: (){
    // return AlertDialog(
    //   title: new Text("Ishraak Solutions Limited"),
    //   content: new Text("Software Company"),
    //   backgroundColor: Colors.white,
    //   shape:
    //   RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
    //   actions: <Widget>[
    //     new FlatButton(
    //       child: new Text("Go To Details Page"),
    //       textColor: Colors.greenAccent,
    //       onPressed: () {
    //         // this._yesOnPressed();
    //       },
    //     ),
    //     new FlatButton(
    //       child: Text("No"),
    //       textColor: Colors.redAccent,
    //       onPressed: () {
    //         // this._noOnPressed();
    //       },
    //     ),
    //   ],
    // );
    //Navigator.push(context, builder:(context)=>)
    

    print("Tapped on Marker");
  },
  position: LatLng(23.776141, 90.414745),
  infoWindow: InfoWindow(title: 'Ishraak Solutions Limited'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

// Widget tapOnJob(BuildContext context){
//
// }

Marker bernardinMarker = Marker(
  markerId: MarkerId('TigerIt'),
  position: LatLng(23.779302, 90.416096),
  infoWindow: InfoWindow(title: 'Tiger IT Limited'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('StarDesignDB'),
  position: LatLng(23.775851, 90.412223),
  infoWindow: InfoWindow(title: 'Star Design DB'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueAzure,
  ),
);

//New York Marker

// Marker newyork1Marker = Marker(
//   markerId: MarkerId('newyork1'),
//   position: LatLng(40.742451, -74.005959),
//   infoWindow: InfoWindow(title: 'Los Tacos'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
// Marker newyork2Marker = Marker(
//   markerId: MarkerId('newyork2'),
//   position: LatLng(40.729640, -73.983510),
//   infoWindow: InfoWindow(title: 'Tree Bistro'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
// Marker newyork3Marker = Marker(
//   markerId: MarkerId('newyork3'),
//   position: LatLng(40.719109, -74.000183),
//   infoWindow: InfoWindow(title: 'Le Coucou'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );