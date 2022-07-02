import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_demo/rocket_details/cubit/rocket_details_cubit.dart';

import '../test_data.dart';

void main() {
  group('RocketDetailsCubit', () {
    test('initial state is correct', () {
      expect(
        RocketDetailsCubit(rocket: rocket).state,
        equals(RocketDetailsState(rocket: rocket)),
      );
    });
  });
}
