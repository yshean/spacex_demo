import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';

void main() {
  group('RocketsState', () {
    test('supports value comparison', () {
      expect(
        const RocketsState(status: RocketsStatus.success, rockets: []),
        const RocketsState(status: RocketsStatus.success, rockets: []),
      );
    });
  });
}
