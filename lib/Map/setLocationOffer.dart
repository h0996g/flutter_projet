import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agence/home/cubitHome/CubitHome.dart';
import 'package:agence/home/cubitHome/homeStates.dart';

import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'const.dart';
import 'location.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class SetLocationOffer extends StatefulWidget {
  const SetLocationOffer({Key? key}) : super(key: key);

  @override
  State<SetLocationOffer> createState() => _SetLocationOfferState();
}

class _SetLocationOfferState extends State<SetLocationOffer> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};
  BitmapDescriptor? _locationIcon;
  LatLng? currentLocation;
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(36.31789608941112, 6.615674905478954),
    zoom: 14.4746,
  );

  @override
  void initState() {
    currentLocation = initialCameraPosition.target;

    _buildMarkerFromAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                markers: _markers,
                initialCameraPosition: initialCameraPosition,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController googleMapController) async {
                  _controller.complete(googleMapController);
                },
                onCameraMove: (CameraPosition newpos) {
                  setState(() {
                    CupitHome.get(context).currentLocation = newpos.target;
                  });
                },
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset('assets/images/location_icon.png'),
              )
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "Marklocation",
                onPressed: () {
                  _setMarker(CupitHome.get(context).currentLocation!);
                  print(CupitHome.get(context).currentLocation);
                },
                child: const Icon(Icons.location_on),
              ),
              const SizedBox(
                height: 8,
              ),
              FloatingActionButton(
                heroTag: "Mylocation",
                onPressed: () => _getMyLocation(),
                child: const Icon(Icons.gps_fixed),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Future<void> _getMyLocation() async {
    LocationData _myLocation = await LocationService().getLocation();
    _animateCamera(LatLng(_myLocation.latitude!, _myLocation.longitude!));
  }

  Future<void> _animateCamera(LatLng _location) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: _location,
      zoom: 13.00,
    );
    print(
        "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  Future<void> _showSearchDialog() async {
    var p = await PlacesAutocomplete.show(
        context: context,
        apiKey: Constants.apiKey,
        mode: Mode.fullscreen,
        language: "ar",
        region: "ar",
        offset: 0,
        hint: "Type here...",
        radius: 1000,
        types: [],
        strictbounds: false,
        components: [Component(Component.country, "ar")]);

    _getLocationFromPlaceId(p!.placeId!);
  }

  Future<void> _getLocationFromPlaceId(String placeId) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: Constants.apiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);

    _animateCamera(LatLng(detail.result.geometry!.location.lat,
        detail.result.geometry!.location.lng));
  }

  Future<void> _buildMarkerFromAssets() async {
    if (_locationIcon == null) {
      _locationIcon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: const Size(48, 48)),
          'assets/images/location_icon.png');
      setState(() {});
    }
  }

  void _setMarker(LatLng _location) {
    _markers = {};

    Marker newMarker = Marker(
      markerId: MarkerId(_location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: _location,
      infoWindow: InfoWindow(
          title: "Title",
          snippet:
              "${CupitHome.get(context).currentLocation!.latitude}, ${CupitHome.get(context).currentLocation!.longitude}"),
    );
    _markers.add(newMarker);

    setState(() {});
  }
}
