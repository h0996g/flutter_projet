import 'dart:async';
import 'dart:convert';
// import 'dart:collection';

import 'package:agence/home/cubitHome/cupit_home.dart';
import 'package:agence/home/cubitHome/homeStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  // static CameraPosition _initialCameraPosition = const CameraPosition(
  //   target: const LatLng(33.515343, 36.289590),
  //   // target: LatLng(36.31789608941112, 6.615674905478954),
  //   zoom: 14.4746,
  // );
  Set<Marker> _markers = {};
  BitmapDescriptor? _locationIcon;
  // LatLng? currentLocation;
  // CameraPosition? initialCameraPosition;
  // var myMarkers = HashSet<Marker>();
  @override
  void initState() {
    // initialCameraPosition = const CameraPosition(
    //   target: const LatLng(33.515343, 36.289590),
    //   // target: LatLng(36.31789608941112, 6.615674905478954),
    //   zoom: 14.4746,
    // );
    CupitHome.get(context).awalLocation(CupitHome.get(context).currentLocation);
    CupitHome.get(context).currentLocation =
        CupitHome.get(context).initialCameraPosition!.target;
    _buildMarkerFromAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: _showSearchDialog, icon: const Icon(Icons.search))
            ],
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                markers: _markers,
                initialCameraPosition:
                    CupitHome.get(context).initialCameraPosition!,
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
                heroTag: "btn1",
                onPressed: () {
                  print(CupitHome.get(context).currentLocation);
                  // LatLng(38.52900208591146, -98.54919254779816), currentLocation);
                },
                child: const Icon(Icons.settings_ethernet_rounded),
              ),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: () {
                  _setMarker(CupitHome.get(context).currentLocation!);
                  print(CupitHome.get(context).currentLocation);
                  // var k;
                  // k = CupitHome.get(context).currentLocation!.toJson();
                  // print(k);
                  // List<dynamic> ll = [];
                  // ll[0] = CupitHome.get(context).currentLocation!.latitude;
                  // ll[0] = CupitHome.get(context).currentLocation!.longitude;
                  // print(ll);
                  // ll[1] = k[1].toString();
                  // print(k);
                },
                child: const Icon(Icons.location_on),
              ),
              FloatingActionButton(
                heroTag: "btn3",
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
