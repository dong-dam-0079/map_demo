import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/helper/bitmap_convert.dart';
import 'package:map_demo/model/place_model.dart';
import 'package:map_demo/view/google_map/controller/map_controller.dart';

class GoogleMapView extends StatefulWidget {
  GoogleMapView({Key? key}) : super(key: key);

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  final _mapController = Get.put(MapController());
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _mapController.loadPlace();

    _initMarker();
  }

  void _initMarker() async {
    for (var place in _mapController.places) {
      String id = place.id;
      final bitmap = await BitmapConvert.bitmapSvg(context, int.parse(id));

      markers.add(
        Marker(
          markerId: MarkerId(id),
          position: place.latLng,
          infoWindow: InfoWindow(title: place.name),
          icon: bitmap),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return _mapController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : _buildGoogleMap();
          },
        ),
      ),
    );
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      markers: markers,
      initialCameraPosition: const CameraPosition(
        target: LatLng(35.226642, 136.735311),
        zoom: 15.0,
      ),
    );
  }
}
