import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/car_model.dart';
import '../Model/mocks_cars_model.dart';

final carProvider = Provider<List<CarModel>>((ref) {
  return mockCars;
});
