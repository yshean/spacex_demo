import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';
import 'package:spacex_demo/rockets/view/rockets_page.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  group('RocketsPageView', () {
    late RocketsCubit rocketsCubit;
    late MockNavigator navigator;
    late Widget app;

    setUp(() {
      rocketsCubit = MockRocketCubit();
      navigator = MockNavigator();

      when(() => navigator.push<void>(any(that: isRoute<void>())))
          .thenAnswer((_) async {});

      app = BlocProvider.value(
        value: rocketsCubit,
        child: const RocketsView(),
      );
    });

    setUpAll(() {
      registerFallbackValue(const RocketsState());
      registerFallbackValue(Uri());
    });

    testWidgets('renders empty page when status is initial', (tester) async {
      const key = Key('rocketsView_initial_sizedBox');

      when(() => rocketsCubit.state).thenReturn(
        const RocketsState(),
      );

      await tester.pumpApp(app);

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets(
      'renders loading indicator when status is loading',
      (tester) async {
        const key = Key('rocketsView_loading_indicator');

        when(() => rocketsCubit.state).thenReturn(
          const RocketsState(
            status: RocketsStatus.loading,
          ),
        );

        await tester.pumpApp(app);

        expect(find.byKey(key), findsOneWidget);
      },
    );

    testWidgets(
      'renders error text when status is failure',
      (tester) async {
        const key = Key('rocketsView_failure_text');

        when(() => rocketsCubit.state).thenReturn(
          const RocketsState(
            status: RocketsStatus.failure,
          ),
        );

        await tester.pumpApp(app);

        expect(find.byKey(key), findsOneWidget);
      },
    );

    testWidgets(
      'renders list of rockets when status is success',
      (tester) async {
        const key = Key('rocketsView_success_rocketList');

        when(() => rocketsCubit.state).thenReturn(
          RocketsState(
            status: RocketsStatus.success,
            rockets: rockets,
          ),
        );

        await mockNetworkImages(() async {
          await tester.pumpApp(app);
        });

        expect(find.byKey(key), findsOneWidget);
        expect(find.byType(ListTile), findsNWidgets(rockets.length));
      },
    );
  });
}
