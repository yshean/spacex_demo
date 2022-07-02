import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  group('CrewCubit', () {
    late RocketRepository rocketRepository;

    setUp(() {
      rocketRepository = MockRocketRepository();
      when(() => rocketRepository.fetchAllRockets())
          .thenAnswer((_) async => rockets);
    });

    test(
      'initial state is correct',
      () => {
        expect(
          RocketsCubit(rocketRepository: rocketRepository).state,
          equals(const RocketsState()),
        )
      },
    );

    blocTest<RocketsCubit, RocketsState>(
      'emits state with updated rockets',
      build: () => RocketsCubit(rocketRepository: rocketRepository),
      act: (cubit) => cubit.fetchAllRockets(),
      expect: () => [
        const RocketsState(status: RocketsStatus.loading),
        RocketsState(
          status: RocketsStatus.success,
          rockets: rockets,
        ),
      ],
    );

    blocTest<RocketsCubit, RocketsState>(
      'emits failure state when repository throws exception',
      build: () {
        when(() => rocketRepository.fetchAllRockets()).thenThrow(Exception());
        return RocketsCubit(rocketRepository: rocketRepository);
      },
      act: (cubit) => cubit.fetchAllRockets(),
      expect: () => [
        const RocketsState(status: RocketsStatus.loading),
        const RocketsState(
          status: RocketsStatus.failure,
          errorMessage: 'Exception',
        ),
      ],
    );
  });
}
