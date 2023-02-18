import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  static const  CameraPosition _kGoohleplex = CameraPosition(
    target: LatLng(24.566070318815715, 73.70125385255163),
    zoom: 13,
  );

  final Set<Marker> _marker = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> latlng = const [
    LatLng(24.566070318815715, 73.70125385255163),
    LatLng(24.58419198419228, 73.68612629673211),
    LatLng(26.91967357970251, 75.78796079678655),
    LatLng(26.560097752544483, 76.32755065549492),
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < latlng.length; i++) {
      _marker.add(Marker(
        markerId: MarkerId(i.toString()),
        position: latlng[i],
        icon: BitmapDescriptor.defaultMarker,
      ));
      setState(() {});

      _polyline.add(Polyline(
        polylineId: const PolylineId('1'),
        points: latlng,
        color: Colors.orange,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGoohleplex,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        polylines: _polyline,
        // markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
