import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_demo/crew_member_details/crew_member_details.dart';
import 'package:spacex_demo/crew_member_details/cubit/crew_member_details_cubit.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import '../../helpers/helpers.dart';

void main() {
  late CrewMemberDetailsCubit crewMemberDetailsCubit;
  late UrlLauncherPlatform urlLauncherPlatform;
  late Widget app;

  const crewMember = CrewMember(
    id: '0',
    name: 'Alejandro Ferrero',
    status: 'active',
    agency: 'Very Good Aliens',
    image:
        'https://media-exp1.licdn.com/dms/image/C4D03AQHVNIVOMkwQaA/profile-displayphoto-shrink_200_200/0/1631637257882?e=1637193600&v=beta&t=jFm-Ckb0KS0Z5hJDbo3ZBSEZSYLHfllUf4N-IV2NDTc',
    wikipedia: 'https://www.wikipedia.org/',
    launches: ['Launch 1'],
  );

  setUp(() {
    crewMemberDetailsCubit = MockCrewMemberDetailsCubit();
    when(() => crewMemberDetailsCubit.state)
        .thenReturn(const CrewMemberDetailsState(crewMember: crewMember));

    urlLauncherPlatform = MockUrlLauncherPlatorm();
    UrlLauncherPlatform.instance = urlLauncherPlatform;
    when(
      () => urlLauncherPlatform.launchUrl(any(), any()),
    ).thenAnswer((_) async => true);
    app = BlocProvider.value(
      value: crewMemberDetailsCubit,
      child: const CrewMemberDetailsView(),
    );
  });

  setUpAll(() {
    registerFallbackValue(
      const CrewMemberDetailsState(crewMember: crewMember),
    );
    registerFallbackValue(const LaunchOptions());
  });

  group('CrewMemberDetailsPage', () {
    test(
      'has route',
      () {
        expect(
          CrewMemberDetailsPage.route(crewMember: crewMember),
          isA<MaterialPageRoute<void>>(),
        );
      },
    );

    testWidgets('renders CrewMemberDetailsView on route', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpApp(
          Navigator(
            onGenerateRoute: (_) =>
                CrewMemberDetailsPage.route(crewMember: crewMember),
          ),
        );
        expect(find.byType(CrewMemberDetailsView), findsOneWidget);
      });
    });
  });

  group('CrewMemberDetailsView', () {
    testWidgets('renders crew member image header', (tester) async {
      const key = Key('crewMemberDetailsPage_imageHeader');

      await mockNetworkImages(() async {
        await tester.pumpApp(app);
      });

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('renders crew member title header', (tester) async {
      const key = Key('crewMemberDetailsPage_titleHeader');

      await mockNetworkImages(() async {
        await tester.pumpApp(app);
      });

      expect(find.byKey(key), findsOneWidget);
    });

    group('open wikipedia button', () {
      const key = Key('crewMemberDetailsPage_openWikipedia_elevatedButton');

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
            () => urlLauncherPlatform.launchUrl(crewMember.wikipedia, any()),
          ).called(1);
        },
      );
    });
  });
}