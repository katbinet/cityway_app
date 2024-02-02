import 'dart:async';
import 'package:city_way/core/util/showModalBottomSheetWidget.dart';
import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btnInfiniteWidth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            // liteModeEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) {
                _controller.complete(controller);
              }
            },
          ),
          Positioned(
              top: 50,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColorManger.white,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
              child: Btn(
                  text: "Next",
                  onPressed: _showModal,
                  color: AppColorManger.mainAppColor),
            ),
          )
        ],
      ),
    );
  }

  void _showModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
//        return Container(child: Wrap(children: [ShowModalBottomSheet()]));
        return ShowModalBottomSheet();
      },
    );
  }
}
