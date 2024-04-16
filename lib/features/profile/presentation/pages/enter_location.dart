import 'dart:async';
import 'package:city_way/core/util/show_modal_bottom_sheet_widget.dart';
import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
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
        return const ShowModalBottomSheet();
      },
    );
  }
}
