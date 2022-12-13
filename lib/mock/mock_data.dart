import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_demo/model/place_model.dart';

class MockData {
  static List<PlaceModel> listPlaces = [
    PlaceModel('1',
        name: 'School 1', latLng: const LatLng(35.226642, 136.735311)),
    PlaceModel('2',
        name: 'School 2', latLng: const LatLng(35.225380, 136.745997)),
    PlaceModel('3',
        name: 'School 3', latLng: const LatLng(35.243923, 136.739087)),
    PlaceModel('4',
        name: 'School 4', latLng: const LatLng(35.245661, 136.785470)),
    PlaceModel('5',
        name: 'School 5', latLng: const LatLng(35.214444, 136.647897)),
    PlaceModel('6',
        name: 'School 6', latLng: const LatLng(35.139658, 136.702384)),
    PlaceModel('7',
        name: 'School 7', latLng: const LatLng(34.928821, 135.972459)),
    PlaceModel('8',
        name: 'School 8', latLng: const LatLng(34.878627, 135.694153)),
    PlaceModel('9',
        name: 'School 9', latLng: const LatLng(34.800907, 135.696463)),
    PlaceModel('10',
        name: 'School 10', latLng: const LatLng(34.819870, 135.667593)),
    PlaceModel('11',
        name: 'School 11', latLng: const LatLng(34.823260, 135.682585)),
    PlaceModel('12',
        name: 'School 12', latLng: const LatLng(34.850658, 135.635853)),
    PlaceModel('13',
        name: 'School 13', latLng: const LatLng(34.851265, 135.739328)),
    PlaceModel('14',
        name: 'School 14', latLng: const LatLng(34.850468, 135.713959)),
  ];
}
