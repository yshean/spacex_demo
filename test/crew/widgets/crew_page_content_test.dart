import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_demo/crew/cubit/crew_cubit.dart';
import 'package:spacex_demo/crew/view/crew_page.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  group('CrewPageView', () {
    late CrewCubit crewCubit;
    late MockNavigator navigator;

    setUp(() {
      crewCubit = MockCrewCubit();
      navigator = MockNavigator();

      when(() => navigator.push<void>(any(that: isRoute<void>())))
          .thenAnswer((_) async {});
    });

    setUpAll(() {
      registerFallbackValue(const CrewState());
      registerFallbackValue(Uri());
    });

    testWidgets('renders empty page when status is initial', (tester) async {
      const key = Key('crewView_initial_sizedBox');

      when(() => crewCubit.state).thenReturn(
        const CrewState(),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: crewCubit,
          child: const CrewView(),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets(
      'renders loading indicator when status is loading',
      (tester) async {
        const key = Key('crewView_loading_indicator');

        when(() => crewCubit.state).thenReturn(
          const CrewState(
            status: CrewStatus.loading,
          ),
        );

        await tester.pumpApp(
          BlocProvider.value(
            value: crewCubit,
            child: const CrewView(),
          ),
        );

        expect(find.byKey(key), findsOneWidget);
      },
    );

    testWidgets(
      'renders error text when status is failure',
      (tester) async {
        const key = Key('crewView_failure_text');

        when(() => crewCubit.state).thenReturn(
          const CrewState(
            status: CrewStatus.failure,
          ),
        );

        await tester.pumpApp(
          BlocProvider.value(
            value: crewCubit,
            child: const CrewView(),
          ),
        );

        expect(find.byKey(key), findsOneWidget);
      },
    );

    testWidgets(
      'renders list of crew members when status is success',
      (tester) async {
        const key = Key('crewView_success_crewMemberList');

        when(() => crewCubit.state).thenReturn(
          CrewState(
            status: CrewStatus.success,
            crewMembers: crewMembers,
          ),
        );

        await mockNetworkImages(() async {
          await tester.pumpApp(
            BlocProvider.value(
              value: crewCubit,
              child: const CrewView(),
            ),
          );
        });

        expect(find.byKey(key), findsOneWidget);
        expect(find.byType(ListTile), findsNWidgets(crewMembers.length));
      },
    );
  });
}
