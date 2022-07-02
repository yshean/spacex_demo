import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:spacex_demo/rocket_details/cubit/rocket_details_cubit.dart';
import 'package:spacex_demo/rocket_details/widgets/widgets.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  late RocketDetailsCubit rocketDetailsCubit;
  late Widget app;

  setUp(() {
    rocketDetailsCubit = MockRocketDetailsCubit();
    when(() => rocketDetailsCubit.state)
        .thenReturn(RocketDetailsState(rocket: rocket));

    app = BlocProvider.value(
      value: rocketDetailsCubit,
      child: const ImageHeader(),
    );
  });

  group('image header', () {
    testWidgets(
      'renders an image with the provided imageUrl',
      (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpApp(app);
        });

        expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is DecoratedBox &&
                (((widget.decoration as BoxDecoration).image)?.image
                            as NetworkImage?)
                        ?.url ==
                    rocket.flickrImages.first,
          ),
          findsOneWidget,
        );
      },
    );
  });
}
