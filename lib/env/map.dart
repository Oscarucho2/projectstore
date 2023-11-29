import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;

  late LatLng _center = const LatLng(22.144596, -101.009064);

  //Guardar los puntos con las coordenadas (lat, lng)
  final List<LatLng> polyPoints = [];
  //Guardar las lineas sobre el mapa
  final Set<Polyline> polyLines = {};
  static const LatLng sourceLocation =
      LatLng(22.13809815759307, -100.91154069356105); //
  static const LatLng destination =
      LatLng(22.149065850100932, -100.94684916479362); //

  double lat = 0.0;
  double lng = 0.0;

  @override
  void initState() {
    // Función que realiza el llamado a la api
    // Se encarga de crear nuestras marcas personalizadas

    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void actualizaCoordenadas(String lat, String lng) {
    _center = LatLng(double.parse(lat), double.parse(lng));
  }

  //Imagen -> Marca para visualizar en el mapa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localiza los puntos de venta'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            polylines: polyLines,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: {
              const Marker(
                markerId: MarkerId("Sucursal 1"),
                position: sourceLocation,
                infoWindow: InfoWindow(title: "Santa anna"),
              ),
              Marker(
                  markerId: MarkerId("Sucursal 2"),
                  position: destination,
                  infoWindow: const InfoWindow(title: "Colorines"),
                  onTap: () {
                    setState(() {
                      showAlertDialog(context);
                    });
                  }),
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
        ],
      ),
    );
  }

  Future<void> _goToNewYork(double lat, double lng) async {
    //double lat = 40.7128;
    //double long = -74.0060;
    mapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 16));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
