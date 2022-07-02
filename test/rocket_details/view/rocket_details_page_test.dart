import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_demo/rocket_details/rocket_details.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  late RocketDetailsCubit rocketDetailsCubit;
  late UrlLauncherPlatform urlLauncherPlatform;
  late Widget app;

  setUp(() {
    rocketDetailsCubit = MockRocketDetailsCubit();
    when(() => rocketDetailsCubit.state)
        .thenReturn(RocketDetailsState(rocket: rocket));

    urlLauncherPlatform = MockUrlLauncherPlatorm();
    UrlLauncherPlatform.instance = urlLauncherPlatform;
    when(
      () => urlLauncherPlatform.launchUrl(any(), any()),
    ).thenAnswer((_) async => true);
    app = BlocProvider.value(
      value: rocketDetailsCubit,
      child: const RocketDetailsView(),
    );
  });

  setUpAll(() {
    registerFallbackValue(
      RocketDetailsState(rocket: rocket),
    );
    registerFallbackValue(const LaunchOptions());
  });

  group('RocketDetailsPage', () {
    test(
      'has route',
      () {
        expect(
          RocketDetailsPage.route(rocket: rocket),
          isA<MaterialPageRoute<void>>(),
        );
      },
    );

    testWidgets('renders RocketDetailsView on route', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpApp(
          Navigator(
            onGenerateRoute: (_) => RocketDetailsPage.route(rocket: rocket),
          ),
        );
        expect(find.byType(RocketDetailsView), findsOneWidget);
      });
    });
  });

  group('RocketDetailsView', () {
    testWidgets('renders first flickr image if present', (tester) async {
      const key = Key('rocketDetailsPage_imageHeader');

      await mockNetworkImages(() async {
        await tester.pumpApp(app);
      });

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders rocket title header', (tester) async {
      const key = Key('rocketDetailsPage_titleHeader');

      await mockNetworkImages(() async {
        await tester.pumpApp(app);
      });

      expect(find.byKey(key), findsOneWidget);
    });

    group('open wikipedia button', () {
      const key = Key('rocketDetailsPage_openWikipedia_elevatedButton');

      testWidgets(
        'is rendered',
        (tester) async {
          await mockNetworkImages(() async {
            await tester.pumpApp(app);
          });

          expect(find.byKey(key), findsOneWidget);
        },
      );

      testWidgets(
        'attempts to open wikipedia url when pressed',
        (tester) async {
          await mockNetworkImages(() async {
            await tester.pumpApp(app);
          });

          await tester.tap(find.byKey(key));

          verify(
            () => urlLauncherPlatform.launchUrl(rocket.wikipedia!, any()),
          ).called(1);
        },
      );
    });
  });
}
