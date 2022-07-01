import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_demo/crew_member_details/cubit/crew_member_details_cubit.dart';
import 'package:spacex_demo/crew_member_details/widgets/widgets.dart';

import '../../helpers/helpers.dart';

void main() {
  late CrewMemberDetailsCubit crewMemberDetailsCubit;
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

    app = BlocProvider.value(
      value: crewMemberDetailsCubit,
      child: const TitleHeader(),
    );
  });

  group('title header', () {
    testWidgets(
      'renders check icon when crew member is active',
      (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpApp(app);
        });

        expect(find.byIcon(Icons.check), findsOneWidget);
      },
    );

    testWidgets(
      'renders cross icon when crew member is inactive',
      (tester) async {
        when(() => crewMemberDetailsCubit.state).thenReturn(
          const CrewMemberDetailsState(
            crewMember: CrewMember(
              id: '0',
              name: 'Alejandro Ferrero',
              status: 'inactive',
              agency: 'Very Good Aliens',
              image:
                  'https://media-exp1.licdn.com/dms/image/C4D03AQHVNIVOMkwQaA/profile-displayphoto-shrink_200_200/0/1631637257882?e=1637193600&v=beta&t=jFm-Ckb0KS0Z5hJDbo3ZBSEZSYLHfllUf4N-IV2NDTc',
              wikipedia: 'https://www.wikipedia.org/',
              launches: ['Launch 1'],
            ),
          ),
        );

        await mockNetworkImages(() async {
          await tester.pumpApp(app);
        });

        expect(find.byIcon(Icons.close), findsOneWidget);
      },
    );

    testWidgets('renders agency subtitle', (tester) async {
      const agencyKey = Key('crewMemberDetailsPage_titleHeader_agencyRichText');

      await mockNetworkImages(() async {
        await tester.pumpApp(app);
      });

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.key == agencyKey &&
              widget.text.toPlainText() == 'Agency: ${crewMember.agency}',
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders launch subtitle', (tester) async {
      const launchKey = Key('crewMemberDetailsPage_titleHeader_launchRichText');

      await mockNetworkImages(() async {
        await tester.pumpApp(app);
      });

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.key == launchKey &&
              widget.text.toPlainText() ==
                  'Has participated in ${crewMember.launches.length} launch',
        ),
        findsOneWidget,
      );
    });
  });
}
