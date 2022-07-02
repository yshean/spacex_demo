import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_demo/rocket_details/cubit/rocket_details_cubit.dart';

import '../test_data.dart';

void main() {
  group('RocketDetailsState', () {
    test('supports value comparison', () {
      expect(
        RocketDetailsState(rocket: rocket),
        RocketDetailsState(rocket: rocket),
      );
    });
  });
}
