import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;

  late LatLng _center = const LatLng(22.144596, -101.009064);
  final List<LatLng> polyPoints = [];
  final Set<Polyline> polyLines = {};
  static const LatLng sourceLocation =
      LatLng(22.135035, -101.017399);
      
  double lat = 0.0;
  double lng = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void actualizaCoordenadas(String lat, String lng) {
    _center = LatLng(double.parse(lat), double.parse(lng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Tiendita'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              polylines: polyLines,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: {
                const Marker(
                  markerId: MarkerId("Mi Tiendita"),
                  position: sourceLocation,
                  infoWindow: InfoWindow(title: "La garita"),
                ),
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              onCameraMove: (CameraPosition position) {
                try {
                  lat = position.target.latitude;
                  lng = position.target.longitude;
                } catch (e) {
                  print('Get Service _createMarker: ' + e.toString());
                }
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
