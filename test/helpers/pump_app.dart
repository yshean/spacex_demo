// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex_demo/l10n/l10n.dart';

import 'helpers.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    CrewMemberRepository? crewMemberRepository,
    RocketRepository? rocketRepository,
    MockNavigator? navigator,
  }) {
    final innerChild = Scaffold(body: widget);

    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: crewMemberRepository ?? MockCrewMemberRepository(),
          ),
          RepositoryProvider.value(
            value: rocketRepository ?? MockRocketRepository(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: navigator == null
              ? innerChild
              : MockNavigatorProvider(
                  navigator: navigator,
                  child: innerChild,
                ),
        ),
      ),
    );
  }
}
