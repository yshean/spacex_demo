import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_demo/rocket_details/rocket_details.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';
import 'package:spacex_demo/rockets/view/rockets_page.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  late RocketsCubit rocketsCubit;
  late MockNavigator navigator;

  setUp(() {
    rocketsCubit = MockRocketCubit();
    navigator = MockNavigator();

    when(() => navigator.push<void>(any(that: isRoute<void>())))
        .thenAnswer((_) async {});
  });

  setUpAll(() {
    registerFallbackValue(const RocketsState());
    registerFallbackValue(Uri());
  });

  testWidgets(
    'navigates to RocketDetailsPage when rocket is tapped',
    (tester) async {
      when(() => rocketsCubit.state).thenReturn(
        RocketsState(
          status: RocketsStatus.success,
          rockets: rockets,
        ),
      );
      await mockNetworkImages(() async {
        await tester.pumpApp(
          BlocProvider.value(
            value: rocketsCubit,
            child: const RocketsView(),
          ),
          navigator: navigator,
        );
      });

      await tester.tap(find.text(rockets.first.name));

      verify(
        () => navigator.push<void>(
          any(
            that: isRoute<void>(
              whereName: equals(
                RocketDetailsPage.routeName(rocket: rockets.first),
              ),
            ),
          ),
        ),
      ).called(1);
    },
  );
}
