import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_demo/crew/cubit/crew_cubit.dart';
import 'package:spacex_demo/crew/view/crew_page.dart';
import 'package:spacex_demo/crew_member_details/crew_member_details.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
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

  testWidgets(
    'navigates to CrewMemberDetailsPage when crew member is tapped',
    (tester) async {
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
          navigator: navigator,
        );
      });

      await tester.tap(find.text(crewMembers.first.name));

      verify(
        () => navigator.push<void>(
          any(
            that: isRoute<void>(
              whereName: equals(CrewMemberDetailsPage.routeName),
            ),
          ),
        ),
      ).called(1);
    },
  );
}
